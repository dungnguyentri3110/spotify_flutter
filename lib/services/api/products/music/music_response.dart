class ListMusicResponse {
  final int id;
  final String name;
  final String file_size;
  final bool? playing;

  ListMusicResponse(
      {required this.id,
      required this.name,
      required this.file_size,
      required this.playing});

  factory ListMusicResponse.fromJson(Map<String, dynamic> json) {
    return ListMusicResponse(
        id: json['id'],
        name: json['name'],
        file_size: json['file_size'],
        playing: json['playing']);
  }
}
