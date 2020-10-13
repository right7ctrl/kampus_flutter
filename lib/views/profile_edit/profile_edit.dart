import 'package:chat_app_flutter/core/components/button/app_button.dart';
import 'package:chat_app_flutter/core/components/error/app_error_widget.dart';
import 'package:chat_app_flutter/core/components/indicator/app_loading_widget.dart';
import 'package:chat_app_flutter/models/user/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:chat_app_flutter/core/components/textfield/profile_edit_textformfield.dart';
import 'package:chat_app_flutter/controllers/profile/profile_edit_controller.dart';
import 'package:get/get.dart';

class ProfileEdit extends StatelessWidget {
  final ProfileModel user;
  const ProfileEdit({Key key, @required this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
        centerTitle: true,
      ),
      body: GetBuilder<ProfileEditController>(
        id:"page",
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
              Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ProfileEditTextFormField(
                        controller: controller.nameController,
                        placeholder: "name", // i?.name.toString(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ProfileEditTextFormField(
                        controller: controller.usernameController,
                        placeholder: "username", // i?.username.toString(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ProfileEditTextFormField(
                        controller: controller.schoolController,
                        placeholder: "school", //i?.school.toString(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 12, 30, 12),
                      child: GetX<ProfileEditController>(
                        init: ProfileEditController(),
                        builder: (a) => AppButton(
                          title: 'Giriş Yap',
                          onTap: () {
                            a.editProfile();
                          },
                        ),
                      child: AppButton(
                        title: "Update",
                      ),
                    ),
                  ],
                ),
              );
            }
          }),
    );
  }
}
