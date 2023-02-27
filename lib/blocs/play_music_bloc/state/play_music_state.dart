import 'package:equatable/equatable.dart';

class PlayMusicState extends Equatable {
  final double process;
  final bool play;
  final bool stop;
  final bool repeat;
  final String timer;
  final double duration;

  const PlayMusicState(
      {required this.process,
      required this.play,
      required this.stop,
      required this.timer,
      required this.duration,
      required this.repeat});

  factory PlayMusicState.initState([double? _duration]) {
    print("Duration $_duration");
    return PlayMusicState(
        process: 0,
        play: false,
        stop: false,
        repeat: false,
        timer: "00:00",
        duration: _duration ?? 0.0);
  }

  PlayMusicState copy(
      [double? proccess,
      String? time,
      bool? play,
      bool? stop,
      bool? repeat,
      double? duration]) {
    return PlayMusicState(
        process: proccess ?? process,
        timer: time ?? timer,
        play: play ?? this.play,
        stop: stop ?? this.stop,
        repeat: repeat ?? this.repeat,
        duration: duration ?? this.duration);
  }

  @override
  List<Object?> get props => [process, play, stop, timer, duration, repeat];
}
