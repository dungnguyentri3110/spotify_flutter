import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_flutter/blocs/home_bloc/bloc/home_bloc.dart';
import 'package:spotify_flutter/blocs/home_bloc/home_state/home_state.dart';
import 'package:spotify_flutter/screens/home_screen/widgets/list_artists.dart';
import 'package:spotify_flutter/screens/play_music_screen/play_music_screen.dart';
import 'package:spotify_flutter/services/api/products/music/music_response.dart';

class PageItem extends StatefulWidget {
  const PageItem({Key? key}) : super(key: key);

  @override
  _PageItemState createState() => _PageItemState();
}

class _PageItemState extends State<PageItem> {
  void onPressGoPlayMusic(
      ListMusicResponse item, List<ListMusicResponse> listMusic) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            PlayMusicScreen(fileMp3: item, listMusic: listMusic)));
  }

  List<Widget> renderListItem(List<ListMusicResponse> state) {
    List<Widget> list = [];
    for (int i = 0; i < state.length; i++) {
      final item = MusicItem(
        item: state[i],
        onPressNavigateToPlay: (item) {
          onPressGoPlayMusic(item, state);
        },
      );
      list.add(item);
    }
    return list.toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(bottom: 50),
      children: [
        ListArtists(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          margin: const EdgeInsets.only(bottom: 30, top: 30),
          child: Text(
            'Playlist',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
        BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          print("syaye ${state.listMusic}");
          if (state.listMusic.isNotEmpty) {
            return Column(
              children: renderListItem(state.listMusic),
            );
          }
          return Container();
        })
      ],
    );
  }
}

class MusicItem extends StatelessWidget {
  final ListMusicResponse item;
  final Function(ListMusicResponse item) onPressNavigateToPlay;

  const MusicItem(
      {super.key, required this.item, required this.onPressNavigateToPlay});

  String caculTime(double fileSize) {
    String seconds = (fileSize % 60).floor().toString().padLeft(2, '0');
    String minutes = ((fileSize / 60) % 60).floor().toString().padLeft(2, '0');
    return '$minutes : $seconds';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Navigate to Play music Screen
        onPressNavigateToPlay(item);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(children: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                width: 37,
                height: 37,
                color: const Color(0xff272727),
                child: const Icon(
                  Icons.play_arrow_rounded,
                  color: Color(0xff959595),
                  size: 24,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w700),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textWidthBasis: TextWidthBasis.parent,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  child: const Text(
                    'Chưa xác định',
                    style: TextStyle(fontSize: 12),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.centerRight,
                child: Text(caculTime(double.parse(item.file_size))),
              )),
        ]),
      ),
    );
  }
}
