import 'package:flutter/material.dart';
import 'package:flutter_praktikum2_modul1/Components/text_field.dart';
import 'package:flutter_praktikum2_modul1/Constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final Widget suffix;
  final TextInputType keyboardType;

  RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
    this.controller,
    this.suffix,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        cursorColor: primaryColor,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: primaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
          suffix: suffix,
        ),
      ),
    );
  }
}
