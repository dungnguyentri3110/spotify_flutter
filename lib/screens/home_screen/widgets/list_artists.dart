import 'package:flutter/material.dart';
import 'package:spotify_flutter/blocs/home_bloc/models/home_model.dart';
import 'package:spotify_flutter/screens/home_screen/widgets/item_list_artist.dart';

class ListArtists extends StatefulWidget {
  const ListArtists({Key? key}) : super(key: key);

  @override
  _ListArtistsState createState() => _ListArtistsState();
}

class _ListArtistsState extends State<ListArtists> {
  List<HomeModel> listData = [];

  @override
  void initState() {
    super.initState();
    listData.add(HomeModel(
        songName: "Bad Guy", artistName: "Bilie Eilish", imageUrl: ""));
    listData.add(
        HomeModel(songName: "Scorpion", artistName: "Drake", imageUrl: ""));
    listData.add(HomeModel(
        songName: "Bad Guy", artistName: "Bilie Eilish", imageUrl: ""));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 265,
      // color: Colors.yellow,
      margin: const EdgeInsets.only(top: 20),
      child: ListView.builder(
          padding: const EdgeInsets.only(left: 15, right: 25),
          scrollDirection: Axis.horizontal,
          itemCount: listData.length,
          itemBuilder: (context, index) {
            return ItemListArtist(
              item: listData[index],
            );
          }),
    );
  }
}
