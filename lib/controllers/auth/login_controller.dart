import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController _emailController;
  TextEditingController _passwordController;

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  @override
  void onInit() {
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

  void submit() {
    print(_emailController.text);
  }
}
