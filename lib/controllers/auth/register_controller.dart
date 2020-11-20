import 'package:chat_app_flutter/core/constants.dart';
import 'package:chat_app_flutter/core/init/network_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController _emailController;
  TextEditingController _passwordController;
  TextEditingController _rePasswordController;
  GlobalKey<FormState> _formKey;
  var data;

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get rePasswordController => _rePasswordController;
  GlobalKey<FormState> get formKey => _formKey;
  bool get isFormValid => _formKey.currentState.validate();

  @override
  void onInit() {
    _formKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _rePasswordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    _emailController.dispose();
    _passwordController.dispose();
    _rePasswordController.dispose();
    super.onClose();
  }

  void register() async {
    if (formKey.currentState.validate()) {
      isLoading.value = true;
      try {
        print(isLoading.value);
        await NetworkManager.instance.dio.post('$API/auth/register', data: {
          "email": _emailController.text,
          "password": _passwordController.text,
          "school": "MEÜ",
          "username": "${UniqueKey()}",
          "name": "Test kullanıcı"
        }).then((res) {
          if (res.data['response'] == 1) {
            Get.rawSnackbar(
                title: 'Başarılı',
                message: 'Kayıt başarılı, Şimdi giriş yapabilirsiniz.');
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
        Get.rawSnackbar(
          title: 'Hata!',
          message: 'Bilinmeyen bir hata oluştu \n$e',
        );
      }
      isLoading.value = false;
    }
  }
}
