import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String title;
  final bool isLoading;
  final VoidCallback onTap;

  const AuthButton({Key key, this.title, this.isLoading = false, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(8),
      elevation: 8,
      shadowColor: Colors.indigo.shade100,
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
                    color: Theme.of(context).accentColor,
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
