import 'dart:convert';
import 'package:chat_app_flutter/core/init/storage_manager.dart';
import 'package:chat_app_flutter/models/user/token_model.dart';

TokenModel get kToken =>
    TokenModel.fromJson(parseJwt(StorageManager.getToken()));
Map<String, dynamic> parseJwt(String token) {
  if (token != null && token.isNotEmpty && token != '') {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('invalid token');
    }

    final payload = decodeBase64(parts[1]);
    final payloadMap = jsonDecode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('invalid payload');
    }

    return payloadMap;
  } else {
    return {"Hata": "Token Data Boş"};
  }
}

String decodeBase64(String str) {
  String output = str.replaceAll('-', '+').replaceAll('_', '/');

  switch (output.length % 4) {
    case 0:
      break;
    case 2:
      output += '==';
      break;
    case 3:
      output += '=';
      break;
    default:
      throw Exception('Illegal base64url string!"');
  }

  return utf8.decode(base64Url.decode(output));
}
