import 'package:chat_app_flutter/controllers/auth/login_controller.dart';
import 'package:chat_app_flutter/core/components/button/auth_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      // specify type as Controller
      init: LoginController(), // intialize with the Controller
      builder: (value) => Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          body: Column(
            children: [
              Expanded(
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
                              key: value.formKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: value.emailController,
                                    validator: (String val) {
                                      if (val.isEmpty) return 'Zorunlu alan';
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'Mail Adresi',
                                      suffixIcon: Icon(Icons.email),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: BorderSide(
                                          width: 1,
                                          color: Colors.red,
                                        ),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: BorderSide(
                                          width: 1.5,
                                          color: Colors.red,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: BorderSide(
                                          width: 1,
                                          color: Colors.black26,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  TextFormField(
                                    controller: value.passwordController,
                                    validator: (String val) {
                                      if (val.isEmpty) return 'Zorunlu alan';
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'Şifre',
                                      suffixIcon: Icon(Icons.lock),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: BorderSide(
                                          width: 1,
                                          color: Colors.red,
                                        ),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: BorderSide(
                                          width: 1.5,
                                          color: Colors.red,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: BorderSide(
                                          width: 1,
                                          color: Colors.black26,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 32,
                                  ),
                                  AuthButton(
                                    title: 'Giriş Yap',
                                    isLoading: value.isLoading,
                                    onTap: () {
                                      value.login();
                                    },
                                  ),
                                  SizedBox(height: 32),
                                  Text(
                                    'Şifremi unuttum',
                                    style: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontSize: 16),
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
              )
            ],
          )),
    );
  }
}
