import 'package:chat_app_flutter/controllers/auth/login_controller.dart';
import 'package:chat_app_flutter/core/components/button/app_button.dart';
import 'package:chat_app_flutter/core/components/textfield/auth_textformfield.dart';
import 'package:chat_app_flutter/views/auth/register_page.dart';
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
                      child: Text(
                        'LOGO',
                        style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontSize: 22,
                        ),
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
                            style: TextStyle(fontSize: 18),
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
                                    return null;
                                  },
                                ),
                                SizedBox(height: 16),
                                AuthTextFormField(
                                  placeholder: 'Şifre',
                                  controller: controller.passwordController,
                                  suffixIcon: Icons.lock,
                                  validator: (String val) {
                                    if (val.isEmpty) return 'Zorunlu alan';
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
                                    isLoading: a.isLoading.value == 1,
                                    onTap: () {
                                      controller.login();
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
