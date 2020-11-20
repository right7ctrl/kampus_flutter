import 'dart:convert';

import 'package:chat_app_flutter/core/constants.dart';
import 'package:chat_app_flutter/core/init/network_manager.dart';
import 'package:chat_app_flutter/models/chat/chat_detail_model.dart';
import 'package:chat_app_flutter/models/chat/message_item_model.dart';
import 'package:chat_app_flutter/services/io_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';

class ConversationController extends GetxController {
  bool _isLoading = true;
  bool _hasError = false;
  String _errorMessage = '';
  TextEditingController _controller;
  ChatDetailModel _res;

  bool get isLoading => _isLoading;
  bool get hasError => _hasError;
  String get errorMsg => _errorMessage;
  TextEditingController get controller => _controller;
  ChatDetailModel get res => _res;
  @override
  void onInit() {
    print('qwe');
    _controller = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    _controller.dispose();
    super.onClose();
  }

  /// userid: karşıdakinin idsi
  Future<void> getConversationHistory(String userid) async {
    setLoading = true;
    setError = false;
    try {
      await NetworkManager.instance.dio
          .post('$API/chat/detail', data: {"id": "$userid"}).then((res) {
            IOService.emitSeen(userid);
        _res = ChatDetailModel.fromJson(res.data);
      });
    } catch (e, s) {
      print('$e, $s');
      _errorMessage = '$e';
      setError = true;
    }
    setLoading = false;
  }

  set setLoading(bool val) {
    if (val == _isLoading) return;
    _isLoading = val;
    update(['_page']);
  }

  set setError(bool val) {
    if (val == _hasError) return;
    _hasError = val;
    update(['_page']);
  }

  void addMessage(Messages model) {
    _res.messages.add(model);
    update(['_conversation']);
  }

  void onMessageReceive(var message) {
    //{message: message here, sender_id: 5f7ca24523fb6852bde48644}

    final Map<String, dynamic> msg =
        message is String ? jsonDecode(message) : message;

    addMessage(Messages(message: msg['message'], senderId: message['sender_id']));
  }
}
