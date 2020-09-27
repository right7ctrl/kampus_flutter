import 'package:flutter/material.dart';

class AuthTextFormField extends StatelessWidget {

  final TextEditingController controller;
  final String placeholder;
  final void Function(String val) validator;
  final IconData suffixIcon;

  const AuthTextFormField({Key key, this.controller, this.placeholder, this.validator, this.suffixIcon}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        labelText: '$placeholder',
        suffixIcon: Icon(suffixIcon),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            width: 1,
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            width: 1.5,
            color: Colors.red,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(
            width: 1,
            color: Colors.black26,
          ),
        ),
      ),
    );
  }
}
