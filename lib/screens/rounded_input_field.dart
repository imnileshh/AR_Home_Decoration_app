import 'package:ARhomes/screens/text_field_container.dart';
import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: Colors.blueGrey,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Colors.blueGrey,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
