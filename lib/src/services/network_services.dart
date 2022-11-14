import 'package:dio/dio.dart';

class NetworkService {
  NetworkService._internal();

  static final NetworkService _instance = NetworkService._internal();
  factory NetworkService() => _instance;

  static final _dio = Dio();

  fetchPosts(int startIndex, {int limit = 10}) async {
    const url = 'https://psshop.jiwaree888.com/musics';
    final Response response = await _dio.get(url);

    if (response.statusCode == 200){
      return
    }
  }
}
