import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

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
    dio.interceptors.add(InterceptorsWrapper(
        onError: errorMw,
        onRequest: reqMw,
        onResponse: (Response res) {
          res.data = res.data is String ? jsonDecode(res.data) : res.data;
          return res;
        }));
  }

  void errorMw(DioError err) {
    Get.rawSnackbar(
      title: 'Hata! (${err?.response?.statusCode})',
      message: err.response.data['message'] != null &&
              err.response.data['message'] != ''
          ? '${err.response.data['message']}'
          : 'Bir hata oluştu',
    );
  }

  void reqMw(RequestOptions req) {}
}
