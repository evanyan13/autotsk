// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:date_picker_timeline/date_picker_timeline.dart';
import "package:flutter/material.dart";
import "package:autotsk/util/color.dart";
import 'package:autotsk/screen_type/common_components/side_bar.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainLightBgColour,
        drawer: SideBar(),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 16, left: 16),
              child: DatePicker(
                DateTime.now(),
                height: 100,
                width: 80,
                initialSelectedDate: DateTime.now(),
                selectionColor: buttondarkPurpleClr,
                selectedTextColor: Colors.white,
                dateTextStyle: TextStyle(
                  fontFamily: 'Neometric',
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                ),
              ),
            )
          ],
        ));
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Image.asset("assets/logobg.png"),
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
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
