import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String title;
  final bool isLoading;
  final VoidCallback onTap;
  final Color color;
  final Color textColor;

  const AppButton(
      {Key key,
      this.title,
      this.isLoading = false,
      this.onTap,
      this.color = Colors.indigo,
      this.textColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(8),
      elevation: 8,
      shadowColor: color.withOpacity(.4),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          this.onTap();
        },
        child: Container(
          height: 54,
          width: double.infinity,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                isLoading
                    ? Theme(
                        data: ThemeData(
                          cupertinoOverrideTheme: CupertinoThemeData(
                            brightness: Brightness.dark,
                          ),
                        ),
                        child: CupertinoActivityIndicator(),
                      )
                    : Container(),
                isLoading ? SizedBox(width: 12) : Container(),
                Text(
                  '$title',
                  style: TextStyle(
                    fontSize: 18,
                    color: textColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
