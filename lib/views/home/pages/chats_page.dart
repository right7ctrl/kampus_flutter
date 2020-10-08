import 'package:chat_app_flutter/controllers/chat/chat_controller.dart';
import 'package:chat_app_flutter/core/components/error/app_error_widget.dart';
import 'package:chat_app_flutter/core/components/indicator/app_loading_widget.dart';
import 'package:chat_app_flutter/models/chat/chat_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _c = Get.put(ChatController());

    return GetBuilder<ChatController>(
        id: '_page',
        builder: (controller) {
          if (controller.hasError) {
            return AppErrorWidget(
              error: '${controller.errorMsg}',
              onRefresh: () {
                controller.getUserList();
              },
            );
          } else {
            if (controller.isLoading) {
              return AppLoadingWidget();
            } else {
              if (controller?.res?.items != null) {
                /* return ListView.builder(
                  itemBuilder: (context, index) {
                    return ChatItem(item: controller.res.items);
                  },
                  shrinkWrap: true,
                  itemCount: controller?.res?.items?.length ?? 0,
                ); */
              } else {
                return Text('boş');
              }
            }
          }
        });
  }
}

class ChatItem extends StatelessWidget {
  //final MessageItem item;

  //const ChatItem({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        //Get.to(ChatDetail());
      },
      leading: CircleAvatar(
        radius: 24,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Image.network(
            'https://i.insider.com/5cdf0a1393a152734e0fc973?width=1021&format=jpeg',
            height: 64,
            width: 64,
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(
        '1231',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        'Thank you so much!',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '23 dk.',
            style: TextStyle(fontSize: 12, color: Colors.grey.shade400),
          ),
          SizedBox(height: 8),
          Container(
            height: 16,
            width: 16,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(32)),
            child: Center(
              child: Text(
                '3',
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).accentColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
