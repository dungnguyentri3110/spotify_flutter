import 'package:spotify_flutter/services/api/api_manager.dart';

class MusicApi {
  MusicApi.init();
  static final MusicApi instance = MusicApi.init();

  Future getListMusic() async {
    const url = 'get-list-music';
    return ApiManager.api.requestApi(RequestMethod.get, url, null, null, false);
  }
}
