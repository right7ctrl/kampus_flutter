import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app_flutter/controllers/profile/profile_controller.dart';
import 'package:chat_app_flutter/controllers/profile/profile_edit_controller.dart';
import 'package:chat_app_flutter/core/components/error/app_error_widget.dart';
import 'package:chat_app_flutter/core/components/indicator/app_loading_widget.dart';
import 'package:chat_app_flutter/core/functions.dart';
import 'package:chat_app_flutter/core/init/storage_manager.dart';
import 'package:chat_app_flutter/models/user/user_item_model.dart';
import 'package:chat_app_flutter/views/chat/conversation_page.dart';
import 'package:chat_app_flutter/views/profile/profile_edit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  final UserItemModel user;

  const ProfilePage({Key key, this.user}) : super(key: key);

  bool get isMe => user.sId == StorageManager.getParsedToken()['_id'];

  @override
  Widget build(BuildContext context) {
    final _c = Get.put(ProfileController());
    var height = Get.height;

    return Scaffold(
      floatingActionButton: !isMe
          ? FloatingActionButton(
              onPressed: () {
                Get.to(ConversationPage(user: user));
              },
              backgroundColor: Theme.of(context).primaryColor,
              child: Icon(Icons.message, color: Theme.of(context).accentColor),
            )
          : null,
      appBar: AppBar(
        elevation: 0,
        title: Text(isMe ? 'Profilim' : 'Kullanıcı'),
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
                          Stack(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: 70,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  Container(
                                    height: Get.height,
                                    color: Colors.white,
                                    width: double.infinity,
                                    margin: const EdgeInsets.only(top: 48),
                                    child: Column(
                                      children: [
                                        SizedBox(height: 12),
                                        Text('${i.name}',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: Get.width * .15,
                                              vertical: 12),
                                          child: Text('${i.bio}',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey.shade600),
                                              textAlign: TextAlign.center),
                                        ),
                                        if (isMe)
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Material(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                child: InkWell(
                                                  onTap: () {
                                                    Get.to(ProfileEdit(
                                                        user: _c.res));
                                                  },
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 24),
                                                    height: 36,
                                                    child: Center(
                                                      child: Text(
                                                        'Düzenle',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        Divider(height: 48),
                                        Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Material(
                                            color: Colors.white,
                                            elevation: 8,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            shadowColor: Colors.white70,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Okul',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Divider(height: 24),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Icon(Icons.school,
                                                          color: Colors.grey),
                                                      SizedBox(width: 12),
                                                      Text(
                                                          'Erciyes Üniversitesi'),
                                                    ],
                                                  ),
                                                  SizedBox(height: 8),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Icon(Icons.menu_book,
                                                          color: Colors.grey),
                                                      SizedBox(width: 12),
                                                      Text(
                                                          'Bilgisayar Programcılığı'),
                                                    ],
                                                  ),
                                                  SizedBox(height: 8),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Icon(Icons.trip_origin,
                                                          color: Colors.grey),
                                                      SizedBox(width: 12),
                                                      Text('3. Sınıf'),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),

                                        /*    Column(
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
                               */
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                top: 20,
                                left: 12,
                                right: 12,
                                child: CircleAvatar(
                                  radius: 48,
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
