// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import "package:flutter/material.dart";
import "package:autotsk/util/color.dart";
import 'package:autotsk/screen_type/common_components/side_bar.dart';
import 'package:autotsk/screen_type/common_components/nav_bar_dark.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainLightBgColour,
      appBar: buildAppBar(),
      drawer: SideBar(),
      body: Center(
          child: Text(
        "Calendar Page",
        style: TextStyle(
          fontFamily: 'Neometric',
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: Colors.black,
        ),
      )),
      bottomNavigationBar: NavBarDark(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Image.asset("assets/logobg.png"),
      centerTitle: true,
      backgroundColor: mainLightBgColour,
      elevation: 0,
      iconTheme: IconThemeData(color: white),
      actions: <Widget>[
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Transform.scale(
                scale: 0.8,
                child: CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/profileAvatar.png"),
                      radius: 20,
                    ))))
      ],
    );
  }
}
