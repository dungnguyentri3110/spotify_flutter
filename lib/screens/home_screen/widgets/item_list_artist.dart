import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spotify_flutter/blocs/home_bloc/models/home_model.dart';

class ItemListArtist extends StatefulWidget {
  final HomeModel item;
  const ItemListArtist({Key? key, required this.item}) : super(key: key);

  @override
  _ItemListArtistState createState() => _ItemListArtistState();
}

class _ItemListArtistState extends State<ItemListArtist> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: 147,
                height: 195,
                alignment: Alignment.topCenter,
                child: FittedBox(
                  fit: BoxFit.none,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: CachedNetworkImage(
                      width: 147,
                      height: 185,
                      fit: BoxFit.cover,
                      imageUrl:
                          "https://kenh14cdn.com/203336854389633024/2021/6/22/anh-chup-man-hinh-2021-06-18-luc-185739-1624017476541782671842-16243407293961052640072.png",
                      placeholder: (context, url) => const SizedBox(
                        width: 50,
                        height: 50,
                        child: FittedBox(
                            fit: BoxFit.none,
                            child: CircularProgressIndicator(
                              strokeWidth: 5,
                              color: Colors.red,
                            )),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  right: 5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      width: 30,
                      height: 30,
                      color: const Color(0xff272727),
                      child: const Icon(
                        Icons.play_arrow_rounded,
                        color: Color(0xff959595),
                        size: 24,
                      ),
                    ),
                  ))
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 5, left: 10, right: 10),
            child: Text(
              widget.item.songName,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5, left: 10, right: 10),
            child: Text(
              widget.item.artistName,
              style: TextStyle(fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}
