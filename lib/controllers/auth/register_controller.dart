import 'package:chat_app_flutter/core/components/button/app_button.dart';
import 'package:chat_app_flutter/core/init/network_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  var isLoading = 0.obs;
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
    if (isFormValid) {
      isLoading.value = 1;
      await NetworkManager.instance.dio
          .get('https://jsonplaceholder.typicode.com/users')
          .then((res) {
        data = res.data;
      });
      isLoading.value = 0;
    } else {
      print('qqqq');
    }
  }

 
}
