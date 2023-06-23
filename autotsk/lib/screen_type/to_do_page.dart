import 'package:autotsk/util/color.dart';
import 'package:flutter/material.dart';

class ToDoPage extends StatelessWidget {
  const ToDoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainLightBgColour,
      body: Center(child: Text("To Do Page")),
    );
  }
}
