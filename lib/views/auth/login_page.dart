import 'package:chat_app_flutter/controllers/auth/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      // specify type as Controller
      init: LoginController(), // intialize with the Controller
      builder: (value) => Scaffold(
          body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  height: Get.height * .3,
                  color: Theme.of(context).primaryColor,
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
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                           TextFormField(
                              decoration: InputDecoration(
                                labelText: 'email',
                                prefixIcon: Icon(Icons.email),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Colors.black12,),
                                ),
                              ),
                            ),
                            SizedBox(height: 12),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'şifre',
                                prefixIcon: Icon(Icons.lock),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Colors.black12,),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Material(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(8),
                              elevation: 8,
                              shadowColor: Colors.indigo.shade100,
                              child: InkWell(
                                child: Container(
                                  height: 54,
                                  width: double.infinity,
                                  child: Center(
                                    child: Text(
                                      'Giriş Yap',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Theme.of(context).accentColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 12),
                            Text(
                              'Şifremi unuttum',
                              style: TextStyle(
                                color: Colors.grey.shade500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 1,
                              width: Get.width * .2,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 12),
                            Text(
                              'veya',
                              style: TextStyle(
                                color: Colors.grey.shade500,
                              ),
                            ),
                            SizedBox(width: 12),
                            Container(
                              height: 1,
                              width: Get.width * .2,
                              color: Colors.grey,
                            ),
                          ],
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
