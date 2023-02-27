import 'package:equatable/equatable.dart';
import 'package:just_audio/just_audio.dart';

abstract class PlayMusicEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadMusic extends PlayMusicEvent {
  final String musicUrl;
  final String duration;
  LoadMusic({required this.musicUrl, required this.duration});

  @override
  List<Object?> get props => [musicUrl, duration];
}

class StartPlayMusic extends PlayMusicEvent {
  StartPlayMusic();

  @override
  List<Object?> get props => [];
}

class GetDuration extends PlayMusicEvent {
  final double duration;

  GetDuration({required this.duration});

  @override
  List<Object?> get props => [duration];
}

class PlayingMusic extends PlayMusicEvent {
  final double process;
  final double position;

  PlayingMusic({required this.process, required this.position});

  @override
  List<Object?> get props => [process, position];
}

class ResumePlayMusic extends PlayMusicEvent {}

class PauseMusic extends PlayMusicEvent {}

class StopMusic extends PlayMusicEvent {}

class CaculProccess extends PlayMusicEvent {
  final double process;
  final String timer;

  CaculProccess({required this.process, required this.timer});

  @override
  List<Object?> get props => [process, timer];
}

class SeekPositionStart extends PlayMusicEvent {}

class SeekPosition extends PlayMusicEvent {
  final double percent;

  SeekPosition({required this.percent});

  @override
  List<Object?> get props => [percent];
}

class SeekPositionEnd extends PlayMusicEvent {}

class RepeatMusic extends PlayMusicEvent {}
