import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app_flutter/controllers/chat/conversation_controller.dart';
import 'package:chat_app_flutter/core/components/error/app_error_widget.dart';
import 'package:chat_app_flutter/core/components/indicator/app_loading_widget.dart';
import 'package:chat_app_flutter/core/functions.dart';
import 'package:chat_app_flutter/models/chat/chat_detail_model.dart';
import 'package:chat_app_flutter/models/chat/message_item_model.dart';
import 'package:chat_app_flutter/models/user/user_item_model.dart';
import 'package:chat_app_flutter/services/io_service.dart';
import 'package:chat_app_flutter/views/profile/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConversationPage extends StatelessWidget {
  final UserItemModel user;

  const ConversationPage({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _c = Get.put(ConversationController());
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 16,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  imageUrl: '${user.avatar}',
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, progress) =>
                      CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.person),
                ),
              ),
            ),
            SizedBox(width: 12),
            Text('${user.name}'),
          ],
        ),
        actions: [
          IconButton(icon: Icon(Icons.more_horiz), onPressed: () {
            Get.to(ProfilePage(user: user));
          }),
        ],
      ),
      body: GetBuilder<ConversationController>(
        initState: (_) {
          _c.getConversationHistory(user.sId);
        },
        id: '_page',
        builder: (ct) {
          if (ct.hasError)
            return AppErrorWidget(
              onRefresh: () {
                ct.getConversationHistory(user.sId);
              },
              error: '',
            );
          if (ct.isLoading) return AppLoadingWidget();
          return SafeArea(
            maintainBottomViewPadding: true,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(8),
                    reverse: true,
                    child: GetBuilder<ConversationController>(
                      id: '_conversation',
                      builder: (ctrl) {
                        return Column(
                          children: ctrl.res.messages.map((e) {
                            return MessageItem(
                              message: e.message,
                              notMe: e.senderId != kToken.sId,
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: CupertinoTextField(
                          controller: _c.controller,
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 12),
                          placeholder: 'Birşeyler yazın',
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(32),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                        icon: Icon(Icons.send),
                        onPressed: () {
                          final String msg = _c.controller.text;
                          _c.addMessage(
                            Messages(
                              message: msg,
                              senderId: kToken.sId,
                            ),
                          );
                          IOService.sendMsg(user.sId, '$msg');
                          _c.controller.clear();
                        }),
                    SizedBox(width: 8),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class MessageItem extends StatelessWidget {
  final bool notMe;
  final String message;

  const MessageItem({Key key, this.notMe = false, this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Align(
          alignment: !notMe ? Alignment.centerLeft : Alignment.centerRight,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 4),
            child: Column(
              crossAxisAlignment:
                  notMe ? CrossAxisAlignment.start : CrossAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment:
                      notMe ? MainAxisAlignment.start : MainAxisAlignment.end,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: !notMe
                                ? Colors.grey.withOpacity(0.4)
                                : Theme.of(context).primaryColor,
                            borderRadius: !notMe
                                ? BorderRadius.only(
                                    topRight: Radius.circular(16),
                                    bottomRight: Radius.circular(16),
                                    topLeft: Radius.circular(16),
                                  )
                                : BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    bottomLeft: Radius.circular(8),
                                    topRight: Radius.circular(8),
                                  ),
                          ),
                          constraints: BoxConstraints(
                              maxWidth: constraints.maxWidth * 0.65,
                              minWidth: constraints.maxWidth * 0.1),
                          child: Text(
                            '$message',
                            textScaleFactor: 1,
                            style: TextStyle(
                                color: notMe
                                    ? Theme.of(context).accentColor
                                    : Colors.black87,
                                fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 2),
                Text(
                  '13.52',
                  style: TextStyle(fontSize: 10, color: Colors.grey.shade400),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
