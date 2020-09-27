import 'package:dio/dio.dart';

class NetworkManager {
  Dio dio;
  bool showNtf = true;
  static NetworkManager _instance;
  static NetworkManager get instance {
    if (_instance == null) _instance = NetworkManager._init();
    return _instance;
  }

  NetworkManager._init() {
    dio = Dio();
    dio.options.sendTimeout = 12000; //12s
    dio.options.receiveTimeout = 12000; //12s
    dio.options.contentType = 'application/json';
    dio.interceptors
        .add(InterceptorsWrapper(onError: errorMw, onRequest: reqMw));
  }

  void errorMw(DioError err) {}

  void reqMw(RequestOptions req) {}
}
