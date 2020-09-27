import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: UserCard(),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: UserCard(),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: UserCard(),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: UserCard(),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: UserCard(),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: UserCard(),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: UserCard(),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: UserCard(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class UserCard extends StatelessWidget {
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
                        'John Wick',
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
                            'ERU',
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
