import 'package:chat_app_flutter/core/components/button/app_button.dart';
import 'package:chat_app_flutter/core/components/error/app_error_widget.dart';
import 'package:chat_app_flutter/core/components/indicator/app_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:chat_app_flutter/core/components/textfield/profile_edit_textformfield.dart';
import 'package:chat_app_flutter/controllers/profile/profile_edit_controller.dart';
import 'package:get/get.dart';

class ProfileEdit extends StatelessWidget {
  const ProfileEdit({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileEditController>(
        init: ProfileEditController(),
        dispose: (_) => ProfileEditController(),
        builder: (controller) {
          if (controller.hasError) {
            return AppErrorWidget(
              error: '${controller.errorMsg}',
              onRefresh: () {
                controller.editProfile();
              },
            );
          } else if (controller.isLoading) {
            return AppLoadingWidget();
          } else {
            //ar i = controller.res.message;

            Scaffold(
              appBar: AppBar(
                title: Text("Edit Profile"),
                centerTitle: true,
              ),
              body: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ProfileEditTextFormField(
                        placeholder: "name", // i?.name.toString(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ProfileEditTextFormField(
                        placeholder: "username", // i?.username.toString(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ProfileEditTextFormField(
                        placeholder: "school", //i?.school.toString(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 12, 30, 12),
                      child: AppButton(
                        title: "Update",
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        });
  }
}
