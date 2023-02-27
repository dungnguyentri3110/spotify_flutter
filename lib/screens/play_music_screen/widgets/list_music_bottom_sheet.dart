import 'package:flutter/material.dart';
import 'package:spotify_flutter/screens/play_music_screen/widgets/item_list_music.dart';
import 'package:spotify_flutter/services/api/products/music/music_response.dart';

class ListMusicBottomSheet extends StatefulWidget {
  final List<ListMusicResponse> listData;
  final int currentId;
  const ListMusicBottomSheet(
      {Key? key, required this.listData, required this.currentId})
      : super(key: key);

  @override
  _ListMusicBottomSheetState createState() => _ListMusicBottomSheetState();
}

class _ListMusicBottomSheetState extends State<ListMusicBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: widget.listData.length,
            itemBuilder: ((context, index) {
              return ItemListMusic(
                item: widget.listData[index],
                currentId: widget.currentId,
              );
            })));
  }
}
