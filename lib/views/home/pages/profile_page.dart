import 'package:chat_app_flutter/controllers/home/home_page_controller.dart';
import 'package:chat_app_flutter/controllers/profile/profile_controller.dart';
import 'package:chat_app_flutter/core/components/error/app_error_widget.dart';
import 'package:chat_app_flutter/core/components/indicator/app_loading_widget.dart';
import 'package:chat_app_flutter/models/user/user_item_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GetBuilder<ProfileController>(
            init: ProfileController(),
            dispose: (_) => ProfileController(),
            builder: (controller) {
              if (controller.hasError) {
                return AppErrorWidget(
                  error: '${controller.errorMsg}',
                  onRefresh: () {
                    controller.getProfile();
                  },
                );
              } else if (controller.isLoading) {
                return AppLoadingWidget();
              } else {
                var i=controller.res.message;
                return ListTile(title: Text(i.mail));
              }
            },
          ),
        ),
      ],
    );
  }
}
