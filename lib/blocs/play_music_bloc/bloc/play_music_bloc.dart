import 'dart:isolate';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:spotify_flutter/blocs/play_music_bloc/event/play_music_event.dart';
import 'package:spotify_flutter/blocs/play_music_bloc/state/play_music_state.dart';
import 'package:spotify_flutter/utils/time_cacul.dart';

class PlayMusicBloc extends Bloc<PlayMusicEvent, PlayMusicState> {
  PlayMusicBloc() : super(PlayMusicState.initState()) {
    on<LoadMusic>(onLoadMusic);
    on<GetDuration>(onGetDuration);
    on<StartPlayMusic>(onStartPlayMusic);
    on<PlayingMusic>(onPlayingMusic);
    on<CaculProccess>(onCaculProcess);
    on<SeekPositionStart>(onSeekStart);
    on<SeekPosition>(onSeek);
    on<SeekPositionEnd>(onSeekEnd);
    on<RepeatMusic>(onRepeat);
    createIsolate();
  }

  Isolate? isolate;
  SendPort? sendPort;
  AudioPlayer player = AudioPlayer();
  bool played = false;

  Future createIsolate() async {
    ReceivePort receivePort = ReceivePort();
    isolate = await Isolate.spawn(workThread, receivePort.sendPort);
    receivePort.listen((message) {
      if (message is SendPort) {
        sendPort = message;
      }
      if (message is CaculProccess) {
        add(CaculProccess(timer: message.timer, process: message.process));
      }
    });
  }

  void workThread(SendPort sendP) {
    ReceivePort receivePort = ReceivePort();
    sendP.send(receivePort.sendPort);

    receivePort.listen((message) {
      if (message is PlayingMusic) {
        final time = TimeCacul.instance.caculTime(message.position);

        sendP.send(CaculProccess(process: message.process, timer: time));
      }
      if (message is SeekPosition) {}
    });
  }

  void onStartPlayMusic(StartPlayMusic event, Emitter emit) async {
    //Button play or pause
    if (!played) {
      played = true;
      emit(state.copy(null, null, played));
      await player.play();
    } else {
      played = false;
      emit(state.copy(null, null, played));
      await player.pause();
    }
  }

  void onGetDuration(GetDuration event, Emitter emit) {
    emit(PlayMusicState.initState(event.duration));
  }

  void onPlayingMusic(PlayingMusic event, Emitter emit) {
    sendPort?.send(event);
  }

  void onCaculProcess(CaculProccess event, Emitter emit) {
    emit(state.copy(event.process, event.timer));
  }

  void onLoadMusic(LoadMusic event, Emitter emit) {
    player.setVolume(1.0);
    player.setUrl(event.musicUrl).then((value) async {
      //Get total duration

      // double total = player.duration!.inMilliseconds / 1000;
      // add(GetDuration(duration: total));
      player.durationStream.listen((event) {
        print("DDDD ${event?.inSeconds}");
        add(GetDuration(duration: (event!.inSeconds).toDouble()));
      });

      //Cacul current position
      player.positionStream.listen((event) {
        int duration = player.duration!.inMilliseconds;
        double process = event.inMilliseconds / duration;
        if (process >= 1.0) {
          process = 1.0;
        }

        add(PlayingMusic(
            process: process, position: event.inMilliseconds / 1000));
      });
    }).catchError((error) {
      print("error $error");
    });
  }

  void onSeekStart(SeekPositionStart event, Emitter emit) async {
    played = false;
    emit(state.copy(
      null,
      null,
      played,
    ));
    await player.pause();
  }

  void onSeek(SeekPosition event, Emitter emit) {
    //Seek Music
    sendPort?.send(SeekPosition(percent: event.percent));
    int position = (state.duration * event.percent).round();
    player.seek(Duration(seconds: position));
  }

  void onSeekEnd(SeekPositionEnd event, Emitter emit) async {
    played = true;
    emit(state.copy(null, null, played));
    await player.play();
  }

  void onRepeat(RepeatMusic event, Emitter emit) {
    final repeat = !state.repeat;
    if (repeat == true) {
      player.setLoopMode(LoopMode.one);
    } else {
      player.setLoopMode(LoopMode.off);
    }
    emit(state.copy(null, null, null, null, repeat));
  }

  @override
  Future<void> close() {
    player.stop();
    isolate?.kill(priority: Isolate.immediate);
    isolate = null;
    return super.close();
  }
}
