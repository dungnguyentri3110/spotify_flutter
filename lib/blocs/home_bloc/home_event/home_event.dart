import 'package:equatable/equatable.dart';
import 'package:spotify_flutter/services/api/products/music/music_response.dart';

abstract class HomeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchListMusic extends HomeEvent {}

class FetchListMusicSuccess extends HomeEvent {
  final List<ListMusicResponse> listData;

  FetchListMusicSuccess({required this.listData});
  @override
  List<Object?> get props => [listData];
}
