import 'dart:isolate';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_flutter/blocs/home_bloc/home_event/home_event.dart';
import 'package:spotify_flutter/blocs/home_bloc/home_state/home_state.dart';
import 'package:spotify_flutter/services/api/products/music/music_api.dart';
import 'package:spotify_flutter/services/api/products/music/music_response.dart';
import 'package:spotify_flutter/services/api/status_request.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initState()) {
    createIsolate();
    on<FetchListMusic>(onFetchListMusic);
    on<FetchListMusicSuccess>(onFetchListMusicSuccess);
  }

  Isolate? isolate;
  SendPort? sendPort;

  Future createIsolate() async {
    ReceivePort receivePort = ReceivePort();
    isolate = await Isolate.spawn(onListen, receivePort.sendPort);
    receivePort.listen((message) {
      print("Fetch $message");
      if (message is SendPort) {
        sendPort = message;
        sendPort?.send('fetch');
      }
      if (message is HomeState) {
        add(FetchListMusicSuccess(listData: message.listMusic));
      }
    });
  }

  void onListen(SendPort sendPort) {
    print("Fetch $sendPort");
    final receivePort = ReceivePort();
    sendPort.send(receivePort.sendPort);

    receivePort.listen((message) async {
      if (message is String && message == 'fetch') {
        try {
          Response response = await MusicApi.instance.getListMusic();
          if (response.statusCode == StatusRequest.instance.success) {
            List<dynamic> listData = response.data['data'];
            List<ListMusicResponse> listMusic = [];
            print("List music ${response.data['data']}");

            for (int i = 0; i < listData.length; i++) {
              ListMusicResponse item = ListMusicResponse.fromJson(listData[i]);
              listMusic.add(item);
            }

            sendPort.send(state.copyState(listMusic.toList()));

            // emit(state.copyState(listMusic.toList()));
          }
        } catch (e) {
          print(e);
        }
      }
    });
  }

  void onFetchListMusicSuccess(FetchListMusicSuccess event, Emitter emit) {
    emit(state.copyState(event.listData.toList()));
  }

  void onFetchListMusic(FetchListMusic event, Emitter emit) async {
    print("${sendPort != null}");
  }

  @override
  Future<void> close() {
    isolate?.kill(priority: Isolate.immediate);
    isolate = null;
    return super.close();
  }
}
