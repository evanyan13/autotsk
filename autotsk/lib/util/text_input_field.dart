// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:autotsk/util/color.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPassW;
  final String hintText;
  final TextInputType textInputType;
  final Color bgColor;
  final Icon icon;
  const TextInputField({
    Key? key,
    required this.textEditingController,
    required this.hintText,
    required this.textInputType,
    this.isPassW = false,
    this.bgColor = Colors.white,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
      borderRadius: BorderRadius.all(
        Radius.circular(16.0),
      ),
    );
    return Container(
      margin: EdgeInsets.only(top:4.0),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: hintText,
          border: inputBorder,
          focusedBorder: inputBorder,
          enabledBorder: inputBorder,
          filled: true,
          contentPadding: const EdgeInsets.all(8.0),
          fillColor: bgColor,
          prefixIcon: icon,
        ),
        keyboardType: textInputType,
        obscureText: isPassW,
      ),
    );
  }
}
