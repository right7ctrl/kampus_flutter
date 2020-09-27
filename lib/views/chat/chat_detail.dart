import 'package:chat_app_flutter/core/components/textfield/auth_textformfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                child: Image.network(
                  'https://i.insider.com/5cdf0a1393a152734e0fc973?width=1021&format=jpeg',
                  height: 32,
                  width: 32,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 12),
            Text('Kelly West'),
          ],
        ),
        actions: [IconButton(icon: Icon(Icons.more_horiz), onPressed: () {})],
      ),
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(8),
                reverse: true,
                child: Column(
                  children: [
                    MessageItem(
                      notMe: true,
                      message: 'Hello',
                    ),
                    MessageItem(
                      message:
                          "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                    ),
                    MessageItem(
                      notMe: true,
                      message:
                          'a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.',
                    ),
                    MessageItem(
                      notMe: true,
                      message: 'many variations',
                    ),
                    MessageItem(
                      message:
                          'Lorem Ipsum is therefore always free from repetition',
                    ),
                    MessageItem(
                      notMe: true,
                      message:
                          'sometimes by accident, sometimes on purpose (injected humour and the like)',
                    ),
                    MessageItem(
                      notMe: true,
                      message: 'haha',
                    ),
                    MessageItem(
                      message:
                          'Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.',
                    ),
                    MessageItem(
                      notMe: true,
                      message: 'qweqeqqwe',
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: CupertinoTextField(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                      placeholder: 'Birşeyler yazın',
                      decoration: BoxDecoration(
                        border:
                            Border.all(width: 1, color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                  ),
                ),
                IconButton(icon: Icon(Icons.send), onPressed: () {}),
                SizedBox(width: 8),
              ],
            ),
          ],
        ),
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
