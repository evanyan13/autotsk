import "package:autotsk/util/color.dart";
import "package:flutter/material.dart";

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainLightBgColour,
      body: Center(child: Text("Calendar Page")),
    );
  }
}
