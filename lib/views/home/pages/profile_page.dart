import 'package:chat_app_flutter/controllers/home/home_page_controller.dart';
import 'package:chat_app_flutter/controllers/profile/profile_controller.dart';
import 'package:chat_app_flutter/core/components/button/app_button.dart';
import 'package:chat_app_flutter/core/components/error/app_error_widget.dart';
import 'package:chat_app_flutter/core/components/indicator/app_loading_widget.dart';
import 'package:chat_app_flutter/models/user/user_item_model.dart';
import 'package:flutter/gestures.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = Get.width;
    var height = Get.height;
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
                var i = controller.res.message;
                //
                return SingleChildScrollView(
                    child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: height * 0.07),
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(32),
                                  topRight: Radius.circular(32))),
                          child: Padding(
                            padding: EdgeInsets.only(top: height * 0.08),
                            child: Column(
                              children: [
                                Center(
                                    child: AutoSizeText(i?.name.toString(),
                                        style: TextStyle(
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold))),
                                Center(
                                    child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: AutoSizeText("UI/UX Designer",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[600],
                                          fontWeight: FontWeight.w400)),
                                )),
                                Center(
                                    child: Padding(
                                  padding: EdgeInsets.only(left: 40, right: 40),
                                  child: AutoSizeText(
                                      "I'm a positive person. I love to travel and discovery new place",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400)),
                                )),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 35, right: 35, top: 12, bottom: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        children: [
                                          AutoSizeText("170",
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.w400)),
                                          AutoSizeText("Followers",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Color(0xFFC7C7C7),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400)),
                                        ],
                                      ),
                                      Container(
                                          width: 1,
                                          height: 40,
                                          color: Colors.black),
                                      Column(
                                        children: [
                                          AutoSizeText("104",
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.w400)),
                                          AutoSizeText("Following",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Color(0xFFC7C7C7),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400)),
                                        ],
                                      ),
                                      Container(
                                          width: 1,
                                          height: 40,
                                          color: Colors.black),
                                      Column(
                                        children: [
                                          AutoSizeText("1024",
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.w400)),
                                          AutoSizeText("Likes",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Color(0xFFC7C7C7),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400)),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: height * 0.01),
                          child: Center(
                            child: CircleAvatar(
                              radius: height * 0.06,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(72),
                                child: Image.network(
                                    'https://i.insider.com/5cdf0a1393a152734e0fc973?width=1021&format=jpeg',
                                    height: 72,
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 12, bottom: 12),
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 35, right: 35, top: 12, bottom: 12),
                          color: Colors.grey[200],
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AutoSizeText("Followers",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600)),
                                  AutoSizeText("View all",
                                      style: TextStyle(
                                          color: Color(0xFF9B45E4),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600)),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 12, bottom: 12),
                                child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 5, right: 5),
                                          child: Column(
                                            children: [
                                              CircleAvatar(
                                                radius: height * 0.03,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(72),
                                                  child: Image.network(
                                                      'https://i.insider.com/5cdf0a1393a152734e0fc973?width=1021&format=jpeg',
                                                      height: 72,
                                                      fit: BoxFit.cover),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 5.0),
                                                child: AutoSizeText("Abuzer",
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w600)),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 5, right: 5),
                                          child: Column(
                                            children: [
                                              CircleAvatar(
                                                radius: height * 0.03,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(72),
                                                  child: Image.network(
                                                      'https://i.insider.com/5cdf0a1393a152734e0fc973?width=1021&format=jpeg',
                                                      height: 72,
                                                      fit: BoxFit.cover),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 5.0),
                                                child: AutoSizeText("Abuzer",
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w600)),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 5, right: 5),
                                          child: Column(
                                            children: [
                                              CircleAvatar(
                                                radius: height * 0.03,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(72),
                                                  child: Image.network(
                                                      'https://i.insider.com/5cdf0a1393a152734e0fc973?width=1021&format=jpeg',
                                                      height: 72,
                                                      fit: BoxFit.cover),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 5.0),
                                                child: AutoSizeText("Abuzer",
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w600)),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 5, right: 5),
                                          child: Column(
                                            children: [
                                              CircleAvatar(
                                                radius: height * 0.03,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(72),
                                                  child: Image.network(
                                                      'https://i.insider.com/5cdf0a1393a152734e0fc973?width=1021&format=jpeg',
                                                      height: 72,
                                                      fit: BoxFit.cover),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 5.0),
                                                child: AutoSizeText("Abuzer",
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w600)),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 5, right: 5),
                                          child: Column(
                                            children: [
                                              CircleAvatar(
                                                radius: height * 0.03,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(72),
                                                  child: Image.network(
                                                      'https://i.insider.com/5cdf0a1393a152734e0fc973?width=1021&format=jpeg',
                                                      height: 72,
                                                      fit: BoxFit.cover),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 5.0),
                                                child: AutoSizeText("Abuzer",
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w600)),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 5, right: 5),
                                          child: Column(
                                            children: [
                                              CircleAvatar(
                                                radius: height * 0.03,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(72),
                                                  child: Image.network(
                                                      'https://i.insider.com/5cdf0a1393a152734e0fc973?width=1021&format=jpeg',
                                                      height: 72,
                                                      fit: BoxFit.cover),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 5.0),
                                                child: AutoSizeText("Abuzer",
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w600)),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 5, right: 5),
                                          child: Column(
                                            children: [
                                              CircleAvatar(
                                                radius: height * 0.03,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(72),
                                                  child: Image.network(
                                                      'https://i.insider.com/5cdf0a1393a152734e0fc973?width=1021&format=jpeg',
                                                      height: 72,
                                                      fit: BoxFit.cover),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 5.0),
                                                child: AutoSizeText("Abuzer",
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w600)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              )
                            ],
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 12),
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 35, right: 35, top: 12, bottom: 12),
                          color: Colors.grey[200],
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  AutoSizeText("Posted",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600)),
                                ],
                              ),
                              Padding(
                                  padding: EdgeInsets.only(top: 12, bottom: 12),
                                  child: Wrap(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(12.0),
                                        child: Container(
                                            width: width * 0.35,
                                            height: width * 0.35,
                                            child: Image(
                                                image: AssetImage(
                                                    "assets/arkaplan10.jpg"),fit: BoxFit.cover,)),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(12.0),
                                        child: Container(
                                            width: width * 0.35,
                                            height: width * 0.35,
                                            child: Image(
                                                image: AssetImage(
                                                    "assets/arkaplan10.jpg"),fit: BoxFit.cover,)),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(12.0),
                                        child: Container(
                                            width: width * 0.35,
                                            height: width * 0.35,
                                            child: Image(
                                                image: AssetImage(
                                                    "assets/arkaplan10.jpg"),fit: BoxFit.cover,)),
                                      ),
                                    ],
                                  ))
                            ],
                          )),
                    )
                  ],
                ));
              }
            },
          ),
        ),
      ],
    );
  }
}
