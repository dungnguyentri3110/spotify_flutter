class HomeModel {
  final String songName;
  final String artistName;
  final String imageUrl;

  HomeModel(
      {required this.songName,
      required this.artistName,
      required this.imageUrl});

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
        songName: json["songName"],
        artistName: json['artistName'],
        imageUrl: json['imageUrl']);
  }
}
