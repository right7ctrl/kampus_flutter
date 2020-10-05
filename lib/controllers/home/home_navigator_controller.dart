import 'package:chat_app_flutter/views/home/pages/chats_page.dart';
import 'package:chat_app_flutter/views/home/pages/home_page.dart';
import 'package:chat_app_flutter/views/home/pages/notifications_page.dart';
import 'package:chat_app_flutter/views/home/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class HomeNavigatorController extends GetxController {
  int currentIndex = 0;
  Map<String, dynamic> get currentItem =>
      bottomBarItems.elementAt(currentIndex);

  void setIndex(val) {
    currentIndex = val;
    update(['bottom_bar_builder', 'title_builder', 'body_builder']);
  }

  List<Map<String, dynamic>> bottomBarItems = [
    {
      "title": "Anasayfa",
      "icon": Icons.home,
      "page": HomePage(),
    },
    {
      "title": "Sohbetler",
      "icon": Icons.chat_bubble_outline,
      "page": ChatsPage()
    },
    {
      "title": "Bildirimler",
      "icon": Icons.notifications,
      "page": NotificationsPage()
    }
  ];
}
