import 'dart:convert';

import 'package:chat_app_flutter/core/constants.dart';
import 'package:chat_app_flutter/core/init/network_manager.dart';
import 'package:chat_app_flutter/models/list/user_list_model.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  RxBool isLoading = true.obs;
  RxBool hasError = false.obs;
  RxString errorMessage = ''.obs;
  Rx<UserListModel> response = UserListModel().obs;

  @override
  void onInit() {
    print('IIIII');
    super.onInit();
  }

  @override
  void onReady() {
    print('ZZZ');
    getUserList();
    super.onReady();
  }

  


  Future<void> getUserList() async {
    print('QQQQQ');
    isLoading.value = true;
    hasError.value = false;
    try {
      print(isLoading.value);
      await NetworkManager.instance.dio
          .post('$API/list/user', data: {}).then((res) {
        response.value = UserListModel.fromJson(res.data);
      });
    } catch (e) {
      hasError.value = true;
      errorMessage.value = '$e';
    }
    isLoading.value = false;
  }
}
