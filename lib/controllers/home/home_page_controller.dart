import 'dart:convert';

import 'package:chat_app_flutter/core/constants.dart';
import 'package:chat_app_flutter/core/init/network_manager.dart';
import 'package:chat_app_flutter/models/list/user_list_model.dart';
import 'package:chat_app_flutter/services/io_service.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  bool _isLoading = true;
  bool _hasError = false;
  String _errorMessage = '';
  UserListModel _response;

  bool get isLoading => _isLoading;
  bool get hasError => _hasError;
  String get errorMsg => _errorMessage;
  UserListModel get res => _response;

  @override
  void onInit() {
    IOService().connectSocket();
    getUserList();
    super.onInit();
  }

  Future<void> getUserList() async {
    setLoading = true;
    setError = false;
    try {
      await NetworkManager.instance.dio
          .post('$API/list/user', data: {}).then((res) {
        _response = UserListModel.fromJson(res.data);
      });
    } catch (e) {
      _errorMessage = '$e';
      setError = true;
    }
    setLoading = false;
  }

  set setLoading(bool val) {
    if (val == _isLoading) return;
    _isLoading = val;
    update();
  }

  set setError(bool val) {
    if (val == _hasError) return;
    _hasError = val;
    update();
  }
}
