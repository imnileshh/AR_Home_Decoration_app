// ignore_for_file: must_be_immutable

import 'package:ARhomes/screens/text_field_container.dart';
import 'package:flutter/material.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  bool visible = true;
  RoundedPasswordField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: visible,
        onChanged: onChanged,
        cursorColor: Colors.blueGrey,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: Colors.blueGrey,
          ),
          suffixIcon: IconButton(
            icon: Icon(Icons.visibility),
            color: Colors.blueGrey,
            onPressed: () {
              visible = false;
            },
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
