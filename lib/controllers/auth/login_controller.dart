import 'package:chat_app_flutter/core/constants.dart';
import 'package:chat_app_flutter/core/init/network_manager.dart';
import 'package:chat_app_flutter/core/init/storage_manager.dart';
import 'package:chat_app_flutter/views/home/home_navigator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController _emailController;
  TextEditingController _passwordController;
  GlobalKey<FormState> _formKey;
  var data;

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  GlobalKey<FormState> get formKey => _formKey;
  bool get isFormValid => _formKey.currentState.validate();


  @override
  void onInit() {
    _formKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    // called after the widget is rendered on screen
    //showIntroDialog();
    super.onReady();
  }

  @override
  void onClose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.onClose();
  }

  void login() async {
    if (formKey.currentState.validate()) {
      isLoading.value = true;
      try {
        print(isLoading.value);
        await NetworkManager.instance.dio.post('$API/auth/login', data: {
          "email": _emailController.text,
          "password": _passwordController.text
        }).then((res) {
          if (res.data['response'] == 1 &&
              res.data.containsKey('token') &&
              res.data['token'] != null &&
              res.data['token'] != '') {
            StorageManager.setToken(res.data['token']);
            Get.offAll(HomeNavigator());
          } else {
            Get.rawSnackbar(
              title: 'Hata!',
              message: res.data['message'] != null && res.data['message'] != ''
                  ? '${res.data['message']}'
                  : 'Bir hata oluştu',
            );
          }
        });
      } catch (e) {
        print(e);
      }
      isLoading.value = false;
    }
  }
}
