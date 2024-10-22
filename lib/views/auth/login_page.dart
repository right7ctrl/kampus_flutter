import 'package:chat_app_flutter/controllers/auth/login_controller.dart';
import 'package:chat_app_flutter/core/components/button/app_button.dart';
import 'package:chat_app_flutter/core/components/textfield/auth_textformfield.dart';
import 'package:chat_app_flutter/core/constants.dart';
import 'package:chat_app_flutter/views/auth/register_page.dart';
import 'package:chat_app_flutter/views/home/home_navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    height: Get.height * .3,
                    color: Colors.transparent,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.school,
                              size: 100, color: Theme.of(context).accentColor),
                          Text(
                            'Kampüs',
                            style: TextStyle(
                                fontSize: 18,
                                color: Theme.of(context).accentColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: Get.height * .7,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Get.width * .07),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Giriş Yap',
                            style: TextStyle(fontSize: 24),
                          ),
                          SizedBox(height: 16),
                          Form(
                            key: controller.formKey,
                            child: Column(
                              children: [
                                AuthTextFormField(
                                  placeholder: 'E-Posta Adresi',
                                  controller: controller.emailController,
                                  suffixIcon: Icons.email,
                                  validator: (String val) {
                                    if (val.isEmpty) return 'Zorunlu alan';
                                    //TODO: add mail validator
                                    return null;
                                  },
                                ),
                                SizedBox(height: 16),
                                AuthTextFormField(
                                  obscureText: true,
                                  placeholder: 'Şifre',
                                  controller: controller.passwordController,
                                  suffixIcon: Icons.lock,
                                  validator: (String val) {
                                    if (val.isEmpty) return 'Zorunlu alan';
                                    if (val.length < PASS_MAX_LEN)
                                      return 'Minimum $PASS_MAX_LEN karakter';
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 32,
                                ),
                                GetX<LoginController>(
                                  init: LoginController(),
                                  builder: (a) => AppButton(
                                    title: 'Giriş Yap',
                                    isLoading: a.isLoading.value,
                                    onTap: () {
                                      a.login();
                                    },
                                  ),
                                ),
                                SizedBox(height: 32),
                                Text(
                                  'Şifremi unuttum',
                                  style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: 16),
                                ),
                                SizedBox(height: 32),
                                InkWell(
                                  onTap: () {
                                    Get.offAll(RegisterPage());
                                  },
                                  child: Text(
                                    'Hesabın yok mu? Kaydol',
                                    style: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
