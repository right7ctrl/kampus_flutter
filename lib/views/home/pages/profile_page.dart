import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app_flutter/controllers/profile/profile_controller.dart';
import 'package:chat_app_flutter/controllers/profile/profile_edit_controller.dart';
import 'package:chat_app_flutter/core/components/error/app_error_widget.dart';
import 'package:chat_app_flutter/core/components/indicator/app_loading_widget.dart';
import 'package:chat_app_flutter/core/functions.dart';
import 'package:chat_app_flutter/models/user/user_item_model.dart';
import 'package:chat_app_flutter/views/chat/conversation_page.dart';
import 'package:chat_app_flutter/views/profile_edit/profile_edit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  final UserItemModel user;

  const ProfilePage({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _c = Get.put(ProfileController());
    var height = Get.height;
    return Scaffold(
      floatingActionButton: user.sId != kToken.sId
          ? FloatingActionButton(
              onPressed: () {
                Get.to(ConversationPage(user: user));
              },
              backgroundColor: Theme.of(context).primaryColor,
              child: Icon(Icons.message, color: Theme.of(context).accentColor),
            )
          : null,
      appBar: AppBar(
        title: Text('Profil'),
        actions: [
          IconButton(
              icon: Icon(Icons.apps),
              onPressed: () {
                Get.to(ProfileEdit(user: _c.res));
              }),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<ProfileController>(
              id: "page",
              init: ProfileController(),
              initState: (_) {
                _c.getProfile(this.user.sId);
              },
              dispose: (_) => ProfileController(),
              builder: (controller) {
                if (controller.hasError) {
                  return AppErrorWidget(
                    error: '${controller.errorMsg}',
                    onRefresh: () {
                      controller.getProfile(this.user.sId);
                    },
                  );
                } else if (controller.isLoading) {
                  return AppLoadingWidget();
                } else {
                  if (controller?.res?.items?.length != null &&
                      controller?.res?.items?.length != 0) {
                    var i = controller.res.items.first;

                    //
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: height * 0.01),
                                child: Center(
                                  child: CircleAvatar(
                                    radius: height * 0.06,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(72),
                                      child: CachedNetworkImage(
                                        imageUrl: '${i.avatar}',
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.cover,
                                        progressIndicatorBuilder:
                                            (context, url, progress) =>
                                                CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.person),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  AutoSizeText('${i.name}',
                                      style: TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold)),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: AutoSizeText(
                                      "${i.school}",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[600],
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 40, right: 40),
                                    child: AutoSizeText(
                                      "I'm a positive person. I love to travel and discovery new place",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 35,
                                        right: 35,
                                        top: 12,
                                        bottom: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          children: [
                                            AutoSizeText("170",
                                                style: TextStyle(
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                            AutoSizeText("jhfgjyf",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Color(0xFFC7C7C7),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          ],
                                        ),
                                        verticalDivider,
                                        Column(
                                          children: [
                                            AutoSizeText("104",
                                                style: TextStyle(
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                            AutoSizeText("Following",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Color(0xFFC7C7C7),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          ],
                                        ),
                                        verticalDivider,
                                        Column(
                                          children: [
                                            AutoSizeText("1024",
                                                style: TextStyle(
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                            AutoSizeText("Likes",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Color(0xFFC7C7C7),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Text('data bos');
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget get verticalDivider =>
      Container(width: 1, height: 40, color: Colors.grey.shade300);
}
