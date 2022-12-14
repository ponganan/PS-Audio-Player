import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ps_audio_player/src/constants/api.dart';
import 'package:ps_audio_player/src/models/post.dart';

class NetworkService {
  NetworkService._internal();

  static final NetworkService _instance = NetworkService._internal();
  factory NetworkService() => _instance;

  static final _dio = Dio();

  Future<List<Post>> getAllMusics(int startIndex, {int limit = 10}) async {
    const url = '${API.BASE_URL}${API.MUSICS}';
    final Response response = await _dio.get(url);
    if (response.statusCode == 200) {
      return postFromJson(jsonEncode(response.data));
    }
    throw Exception('Network failed');
  }
}
