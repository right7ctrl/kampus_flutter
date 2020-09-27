import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'RECENT',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey),
                  ),
                ),
                NotificationIten(),
                PaddedDivider(),
                NotificationIten(),
                PaddedDivider(),
                NotificationIten(),
                PaddedDivider(),
                NotificationIten(),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'OLDEST',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey),
                  ),
                ),
                NotificationIten(),
                PaddedDivider(),
                NotificationIten(),
                PaddedDivider(),
                NotificationIten(),
                PaddedDivider(),
                NotificationIten(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class NotificationIten extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Row(
            children: [
              CircleAvatar(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: Image.network(
                      'https://i.insider.com/5cdf0a1393a152734e0fc973?width=1021&format=jpeg',
                      height: 72,
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Sandy',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Text(' gönderini beğendi.'),
                      ],
                    ),
                    Text(
                      '3 dk. önce',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PaddedDivider extends StatelessWidget {
  final double multiplier;

  const PaddedDivider({Key key, this.multiplier = .2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * multiplier),
      child: Divider(height: 1),
    );
  }
}
