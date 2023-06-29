import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:autotsk/util/color.dart';

class MultiLineText extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPassW;
  final String hintText;
  final TextInputType textInputType;
  final Color bgColor;
  const MultiLineText({
    Key? key,
    required this.textEditingController,
    required this.hintText,
    required this.textInputType,
    this.isPassW = false,
    this.bgColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
      borderRadius: BorderRadius.all(
        Radius.circular(15.0),
      ),
    );
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        filled: true,
        contentPadding: const EdgeInsets.all(8.0),
        fillColor: bgColor,
      ),
      // only change that was made
      keyboardType: TextInputType.multiline,
      expands: true,
      maxLines: null,
      textAlign: TextAlign.center,
      obscureText: isPassW,
    );
  }
}
