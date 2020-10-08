import 'package:get/state_manager.dart';

class ChatController extends GetxController {
  void onMessageReceive(var message) {
    print('message received: $message');
  }
}
