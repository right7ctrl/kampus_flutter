import 'dart:convert';

import 'package:chat_app_flutter/core/constants.dart';
import 'package:chat_app_flutter/core/init/network_manager.dart';
import 'package:chat_app_flutter/models/list/user_list_model.dart';
import 'package:chat_app_flutter/models/user/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileEditController extends GetxController {
  bool _isLoading = true;
  bool _hasError = false;
  String _errorMessage = '';
  ProfileModel _response;
  TextEditingController _nameController;
  TextEditingController _usernameController;
  TextEditingController _schoolController;

  TextEditingController get nameController => _nameController;
  TextEditingController get usernameController => _usernameController;
  TextEditingController get schoolController => _schoolController;
  bool get isLoading => _isLoading;
  bool get hasError => _hasError;
  String get errorMsg => _errorMessage;
  ProfileModel get res => _response;

  @override
  void onInit() {
   
    super.onInit();
  }

  Future<void> editProfile() async {
    setLoading = true;
    setError = false;
    try {
      await NetworkManager.instance.dio.post('$API/user/editProfile', data: {
        //"id":
        "name": nameController.text,
        "username": usernameController.text,
        "school": schoolController.text,
      }).then((res) {
        _response = ProfileModel.fromJson(res.data);
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
    update(["page"]);
  }

  set setError(bool val) {
    if (val == _hasError) return;
    _hasError = val;
    update(["page"]);
  }
}
