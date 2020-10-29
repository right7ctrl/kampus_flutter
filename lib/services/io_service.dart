import 'dart:convert';

import 'package:chat_app_flutter/core/constants.dart';
import 'package:chat_app_flutter/core/functions.dart';
import 'package:chat_app_flutter/core/init/storage_manager.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

IO.Socket kSocket;

class IOService {
  static PublishSubject messageStream = PublishSubject(sync: true);

  _init() {
    print('__init');
    if (kSocket == null) {
      kSocket = IO.io(IO_URL, <String, dynamic>{
        'transports': ['websocket', 'polling']
      });
    }
  }

  void connectSocket() async {
    String token = StorageManager.getToken();
      disconnectSocket();
    if (token != null && token != '' && kSocket == null) {
      _init();

      try {
        kSocket.on('connect', (data) {
           Map<String, dynamic> _token = StorageManager.getParsedToken();

print('${_token['_id']}');
          kSocket.emit('register', '${_token['_id']}');

          kSocket.on('receive_msg', (data) {
            print('socket_receiver: $data');
            messageStream.sink.add(data);
          });
        });
        kSocket.connect();
      } catch (e) {
        print(e);
      }
      print('Socket isconnec2ted: ${kSocket?.connected}');
    } else {
      debugPrint('SOCKET: token yok');
    }

    print('Socket isconnected: ${kSocket?.connected}');
  }

  static void sendMsg(String userid, String message){

    Map<String, dynamic> t = StorageManager.getParsedToken();

    kSocket.emit('send_msg', jsonEncode({
      "receiver_id": userid,
      "message": message,
      "sender_id": t['_id']
    }));
  }

  static void disconnectSocket() async {
    try {
      kSocket?.close();
      kSocket = null;
      debugPrint('SOCKET DISCONNECTED');
    } catch (e) {
      //print(e);
    }
  }
}
