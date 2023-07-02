// ignore_for_file: prefer_const_constructors

import 'package:autotsk/screen_type/addtask_page.dart';
import 'package:flutter/material.dart';
import 'package:autotsk/util/color.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPassW;
  final String hintText;
  final TextInputType textInputType;
  final Color bgColor;
  final Icon? icon;
  final Widget? widget;
  const TextInputField({
    Key? key,
    required this.textEditingController,
    required this.hintText,
    required this.textInputType,
    this.isPassW = false,
    this.bgColor = Colors.white,
    this.icon,
    this.widget,
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
      height: 52,
      margin: EdgeInsets.only(top: 8.0),
      child: Row(
        children: [
          SizedBox(height: 4.0),
          Flexible(
            child: TextField(
              readOnly: widget == null ? false : true,
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
          ),
          widget == null ? Container() : Container(child: widget),
        ],
      ),
    );
  }
}
