import 'package:chat_app_flutter/core/init/storage_manager.dart';
import 'package:chat_app_flutter/views/auth/login_page.dart';
import 'package:chat_app_flutter/views/home/home_navigator.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    await StorageManager.initPrefs();
    
    String _token = StorageManager.getToken();
    await Future.delayed(Duration(milliseconds: 1000), () {
      if (_token != null) {
        Get.offAll(HomeNavigator());
      } else {
        Get.offAll(LoginPage());
      }
    });

    super.onInit();
  }
}
