import 'package:chat_app_flutter/core/init/storage_manager.dart';
import 'package:chat_app_flutter/views/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: Text('Çıkış'),
              onTap: () async {
                StorageManager.clearUserData();
                Get.offAll(LoginPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}
