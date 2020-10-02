import 'dart:convert';

import 'package:chat_app_flutter/core/constants.dart';
import 'package:chat_app_flutter/core/init/network_manager.dart';
import 'package:chat_app_flutter/models/list/user_list_model.dart';
import 'package:chat_app_flutter/models/user/profile_model.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  bool _isLoading = true;
  bool _hasError = false;
  String _errorMessage = '';
  ProfileModel _response;

  bool get isLoading => _isLoading;
  bool get hasError => _hasError;
  String get errorMsg => _errorMessage;
  ProfileModel get res => _response;

  @override
  void onInit() {
    getProfile();
    super.onInit();
  }

  Future<void> getProfile() async {
    setLoading = true;
    setError = false;
    try {
      await NetworkManager.instance.dio.post('$API/user/showProfile',
          data: {"id": "5f664fc49a963c1f74a13bad"}).then((res) {
        _response=ProfileModel.fromJson(res.data);
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
