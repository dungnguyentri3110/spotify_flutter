import 'package:flutter/material.dart';
import 'package:spotify_flutter/services/api/products/music/music_response.dart';

class ItemListMusic extends StatefulWidget {
  final ListMusicResponse item;
  final int currentId;
  const ItemListMusic({Key? key, required this.item, required this.currentId})
      : super(key: key);

  @override
  _ItemListMusicState createState() => _ItemListMusicState();
}

class _ItemListMusicState extends State<ItemListMusic>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: const BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 0.5, color: Color(0xffA7A7A7)))),
      child: Row(
        children: [
          SizedBox(
            width: 50,
            child: widget.currentId == widget.item.id
                ? const Icon(
                    Icons.play_arrow_rounded,
                    size: 26,
                  )
                : Container(),
          ),
          Expanded(
            child: Text(
              widget.item.name,
              style: const TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
