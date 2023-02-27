import 'package:equatable/equatable.dart';
import 'package:spotify_flutter/services/api/products/music/music_response.dart';

class HomeState extends Equatable {
  final List<ListMusicResponse> listMusic;

  const HomeState({required this.listMusic});

  factory HomeState.initState() {
    return const HomeState(listMusic: []);
  }

  HomeState copyState(List<ListMusicResponse> newList) {
    return HomeState(listMusic: newList);
  }

  @override
  List<Object?> get props => [listMusic];
}
