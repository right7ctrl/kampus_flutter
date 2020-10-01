import 'package:chat_app_flutter/controllers/home/home_navigator_controller.dart';
import 'package:chat_app_flutter/core/init/storage_manager.dart';
import 'package:chat_app_flutter/views/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeNavigator extends GetView<HomeNavigatorController> {
  @override
  Widget build(BuildContext context) {
    Get.put(HomeNavigatorController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: GetBuilder<HomeNavigatorController>(
          init: HomeNavigatorController(),
          id: 'title_builder',
          builder: (c) => Text(
            '${c.bottomBarItems.elementAt(c.currentIndex)['title']}',
          ),
        ),
        actions: [
          IconButton(icon: Icon(Icons.add), onPressed: () {}),
          PopupMenuButton(itemBuilder: (context) {
            return [
              PopupMenuItem(child: Text('Bişeyler')),
              PopupMenuItem(child: Text('Bişeyler')),
              PopupMenuItem(child: Text('Bişeyler')),
            ];
          }),
        ],
      ),
      drawer: Drawer(
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
      ),
      bottomNavigationBar: GetBuilder<HomeNavigatorController>(
        id: 'bottom_bar_builder',
        init: HomeNavigatorController(),
        builder: (controller) => BottomNavigationBar(
          currentIndex: controller.currentIndex,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedLabelStyle: TextStyle(color: Colors.grey),
          showUnselectedLabels: true,
          selectedLabelStyle: TextStyle(color: Colors.indigo),
          onTap: (int val) {
            controller.setIndex(val);
          },
          items: controller.bottomBarItems
              .map(
                (e) => BottomNavigationBarItem(
                  icon: Icon(e['icon']),
                  title: Text('${e['title']}'),
                ),
              )
              .toList(),
        ),
      ),
      body: GetBuilder<HomeNavigatorController>(
        id: 'body_builder',
        builder: (c) => c.currentItem['page'],
      ),
    );
  }
}
