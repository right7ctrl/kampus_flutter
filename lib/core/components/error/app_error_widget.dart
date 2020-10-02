import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppErrorWidget extends StatelessWidget {
  final String error;
  final void Function() onRefresh;

  const AppErrorWidget({Key key, this.error, this.onRefresh}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onRefresh,
        child: Container(
          height: Get.height,
          width: Get.width,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.refresh, size: 48),
                Text('$error'),
              ],
            ),
          ),
        ));
  }
}
