import 'package:chat_app_flutter/core/init/storage_manager.dart';
import 'package:chat_app_flutter/views/auth/splash_screen.dart';
import 'package:chat_app_flutter/views/home/pages/home_page.dart';
import 'package:chat_app_flutter/views/profile_edit/profile_edit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageManager.initPrefs();

  String _token = StorageManager.getToken();
  print(_token);
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      smartManagement: SmartManagement.full,
      theme: ThemeData(
        primaryColor: Colors.indigo,
        primaryColorLight: Colors.indigo.shade200,
        accentColor: Colors.white,
        fontFamily: 'Lato'
      ),
      home: SplashScreen(),
    );
  }
}
