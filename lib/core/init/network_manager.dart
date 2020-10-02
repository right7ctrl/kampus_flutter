import 'dart:convert';

import 'package:chat_app_flutter/core/init/storage_manager.dart';
import 'package:chat_app_flutter/views/auth/login_page.dart';
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
    print('e: $err');
    if (err?.response?.statusCode == 401) {
      if (Get.currentRoute != 'LoginPage') {
        Get.offAll(LoginPage());
      }
    } else {
      try {
        if (err?.response?.data != null && err?.response?.data is String) {
          Map<String, dynamic> data = jsonDecode(err.response.data);
          if (data != null && data.containsKey('message')) {
            Get.rawSnackbar(
              title: 'Hata! (${err?.response?.statusCode})',
              message: data['message'] != null && data['message'] != ''
                  ? '${data['message']}'
                  : 'Bir hata oluştu',
            );
          } else {
            Get.rawSnackbar(
                title: 'Hata! (${err?.response?.statusCode})',
                message: 'Bir hata oluştu (else)');
          }
        } else {
          Map<String, dynamic> data = jsonDecode(err.response.data);
          if (data != null && data.containsKey('message')) {
            Get.rawSnackbar(
              title: 'Hata! (${err?.response?.statusCode})',
              message: data['message'] != null && data['message'] != ''
                  ? '${data['message']}'
                  : 'Bir hata oluştu',
            );
          } else {
            Get.rawSnackbar(
                title: 'Hata! (${err?.response?.statusCode})',
                message: 'Bir hata oluştu (else)');
          }
        }
      } catch (e) {
        Get.rawSnackbar(
            title: 'Hata! (${err?.response?.statusCode})',
            message: 'Bir hata oluştu ($e)');
      }
    }
  }

  RequestOptions reqMw(RequestOptions req) {
    req.headers['Authorization'] = 'Bearer ${StorageManager.getToken()}';
    return req;
  }
}
