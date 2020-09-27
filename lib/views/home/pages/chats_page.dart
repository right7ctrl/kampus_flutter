import 'package:chat_app_flutter/views/chat/chat_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ChatItem(),
                ChatItem(),
                ChatItem(),
                ChatItem(),
                ChatItem(),
                ChatItem(),
                ChatItem(),
                ChatItem(),
                ChatItem(),
                ChatItem(),
                ChatItem(),
                ChatItem(),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class ChatItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.to(ChatDetail());
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
        'Mary Jane',
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
