import 'package:chat_app_flutter/controllers/chat/conversation_controller.dart';
import 'package:chat_app_flutter/core/init/storage_manager.dart';
import 'package:chat_app_flutter/services/io_service.dart';
import 'package:chat_app_flutter/views/auth/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageManager.initPrefs();

  String _token = StorageManager.getToken();
  print(_token);
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    final _conversationCtrl = Get.put(ConversationController());

    IOService.messageStream.listen((value) {
      print('AAAA: $value');
      _conversationCtrl.onMessageReceive(value);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      smartManagement: SmartManagement.full,
      theme: ThemeData(
          primaryColor: Colors.indigo,
          primaryColorLight: Colors.indigo.shade200,
          accentColor: Colors.white,
          fontFamily: 'Lato'),
      home: SplashScreen(),
    );
  }
}
