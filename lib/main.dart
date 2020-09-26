import 'package:chat_app_flutter/views/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.indigo,
        primaryColorLight: Colors.indigo.shade200,
        accentColor: Colors.white,
        fontFamily: 'Lato'
      ),
      home: LoginPage(),
    );
  }
}
