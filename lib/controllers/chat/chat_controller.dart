import 'package:chat_app_flutter/core/constants.dart';
import 'package:chat_app_flutter/core/functions.dart';
import 'package:chat_app_flutter/core/init/network_manager.dart';
import 'package:chat_app_flutter/models/chat/chat_list_model.dart';
import 'package:get/state_manager.dart';

class ChatController extends GetxController {
  bool _isLoading = true;
  bool _hasError = false;
  String _errorMessage = '';
  ChatListModel _response;

  bool get isLoading => _isLoading;
  bool get hasError => _hasError;
  String get errorMsg => _errorMessage;
  ChatListModel get res => _response;

  @override
  void onInit() {
    getUserList();
    super.onInit();
  }

  Future<void> getUserList() async {
    setLoading = true;
    setError = false;
    try {
      await NetworkManager.instance.dio
          .post('$API/chat/list', data: {"id": kToken.sId}).then((res) {
            print(res.data);
        _response = ChatListModel.fromJson(res.data);
      });
    } catch (e) {
      _errorMessage = '$e';
      setError = true;
    }
    setLoading = false;
  }

  set setLoading(bool val) {
    if (val == _isLoading) return;
    _isLoading = val;
    update(['_page']);
  }

  set setError(bool val) {
    if (val == _hasError) return;
    _hasError = val;
    update(['_page']);
  }

  void onMessageReceive(var message) {
    print('message received: $message');
  }
}
