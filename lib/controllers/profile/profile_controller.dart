import 'package:chat_app_flutter/core/constants.dart';
import 'package:chat_app_flutter/core/init/network_manager.dart';
import 'package:chat_app_flutter/core/init/storage_manager.dart';
import 'package:chat_app_flutter/views/home/home_navigator.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {  
  RxBool isLoading = false.obs;
  GlobalKey<FormState> _formKey;
  var data;

  GlobalKey<FormState> get formKey => _formKey;
  bool get isFormValid => _formKey.currentState.validate();

  @override
  void onInit() {
    _formKey = GlobalKey<FormState>();
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
    super.onClose();
  }
  
  
  void showProfile() async {
    if (isFormValid) {
      isLoading.value = true;
      try {
        print(isLoading.value);
        await NetworkManager.instance.dio.post('$API/user/showProfile', data: {
          "id": "5f664fc49a963c1f74a13bad"
        }).then((res) {
          if (res.data['response'] == 1) {
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
  }}