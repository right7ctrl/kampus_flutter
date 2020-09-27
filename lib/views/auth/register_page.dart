import 'package:chat_app_flutter/controllers/auth/register_controller.dart';
import 'package:chat_app_flutter/core/components/button/app_button.dart';
import 'package:chat_app_flutter/core/components/textfield/auth_textformfield.dart';
import 'package:chat_app_flutter/views/auth/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    Get.put(RegisterController());
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
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
                                SizedBox(height: 16),
                                AuthTextFormField(
                                  placeholder: 'Şifre Tekrar',
                                  controller: controller.passwordController,
                                  suffixIcon: Icons.lock,
                                  validator: (String val) {
                                    if (val.isEmpty) return 'Zorunlu alan';
                                    return null;
                                  },
                                ),
                                SizedBox(height: 32),
                                GetX<RegisterController>(
                                  init: RegisterController(),
                                  builder: (a) => AppButton(
                                    title: 'Kayıt Ol',
                                    isLoading: a.isLoading.value == 1,
                                    onTap: () {
                                      controller.login();
                                    },
                                  ),
                                ),
                                SizedBox(height: 32),
                                InkWell(
                                  onTap: () {
                                    Get.offAll(LoginPage());
                                  },
                                  child: Text(
                                    'Hesabın var mı? Giriş Yap',
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
