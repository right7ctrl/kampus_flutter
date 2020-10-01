import 'package:chat_app_flutter/controllers/home/home_page_controller.dart';
import 'package:chat_app_flutter/models/user/user_item_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(HomePageController());
    return Column(
      children: [
        Expanded(
          child: GetBuilder<HomePageController>(
            init: HomePageController(),
            dispose: (_) => HomePageController(),
            builder: (controller) {
              if (controller.hasError.value) {
                return Text('${controller.errorMessage.value}');
              } else if (controller.isLoading.value) {
                return Text('${controller.isLoading.value}');
              } else {
                return GridView.builder(
                  padding: EdgeInsets.all(12),
                  itemCount: controller?.response?.value?.items?.length ?? 0,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: .8,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    var f = controller.response.value.items.elementAt(index);
                    return UserCard(
                      user: f,
                    );
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}

class UserCard extends StatelessWidget {
  final UserItemModel user;

  const UserCard({Key key, @required this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8),
      color: Colors.white,
      elevation: 8,
      shadowColor: Colors.black26,
      child: Container(
        padding: EdgeInsets.all(8),
        height: 240,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(32),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Icon(Icons.more_horiz, color: Colors.grey.shade400),
                  ),
                )
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 36,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(72),
                      child: Image.network(
                          'https://i.insider.com/5cdf0a1393a152734e0fc973?width=1021&format=jpeg',
                          height: 72,
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(height: 16),
                  Column(
                    children: [
                      Text(
                        '${user.name}',
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 16),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.school,
                            size: 16,
                          ),
                          SizedBox(width: 8),
                          Text(
                            '${user.school}',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.format_list_numbered,
                            size: 16,
                          ),
                          SizedBox(width: 8),
                          Text(
                            '3/4',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class StoryItem extends StatelessWidget {
  final bool isAdd;
  final bool didView;

  const StoryItem({Key key, this.isAdd = false, this.didView = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (isAdd) {
      return Container(
        margin: EdgeInsets.only(right: 12),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: didView ? Colors.grey.shade300 : null,
                gradient: didView
                    ? null
                    : LinearGradient(colors: [
                        Colors.amber,
                        Colors.indigo,
                        Colors.blue,
                        Colors.green
                      ], stops: [
                        0,
                        .25,
                        .50,
                        1
                      ], begin: Alignment.topCenter),
                borderRadius: BorderRadius.circular(32),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32),
                ),
                padding: EdgeInsets.all(2),
                child: Material(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(24),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(24),
                    onTap: () {},
                    child: Container(
                      height: 46,
                      width: 46,
                      child: Center(
                        child: Icon(
                          Icons.add,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Text(
              'Ekle',
              style: TextStyle(color: Colors.grey.shade400),
            ),
          ],
        ),
      );
    } else {
      return Container(
        margin: EdgeInsets.only(right: 12),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: didView ? Colors.grey.shade300 : null,
                gradient: didView
                    ? null
                    : LinearGradient(colors: [
                        Color.fromRGBO(245, 133, 41, 1),
                        Color.fromRGBO(254, 218, 119, 1),
                        Color.fromRGBO(221, 42, 123, 1),
                        Color.fromRGBO(129, 52, 175, 1),
                        Color.fromRGBO(81, 91, 212, 1),
                      ], stops: [
                        .2,
                        .4,
                        .6,
                        .8,
                        1
                      ], begin: Alignment.topCenter),
                borderRadius: BorderRadius.circular(32),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32),
                ),
                padding: EdgeInsets.all(2),
                child: Material(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(24),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(24),
                    onTap: () {},
                    child: Container(
                      height: 48,
                      width: 48,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(32),
                        child: Image.network(
                            'https://i.insider.com/5cdf0a1393a152734e0fc973?width=1021&format=jpeg',
                            height: 72,
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Text(
              'Alex',
              style: TextStyle(color: Colors.grey.shade400),
            ),
          ],
        ),
      );
    }
  }
}
