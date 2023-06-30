// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import "package:flutter/material.dart";
import "package:autotsk/util/color.dart";
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:autotsk/screen_type/common_components/side_bar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainLightBgColour,
        drawer: SideBar(),
        body: Column(
          children: [
            // To select month of the current view
            buildMonthBar(),
            // Date Picker Slider
            buildDateBar()
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

  Container buildDateBar() {

    return Container(
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
        onDateChange: (selecetedDate) {
          _selectedDate = selecetedDate;
        },
      ),
    );
  }

  Padding buildMonthBar() {
    return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios,
                        color: buttondarkBlueClr,
                        size: 16,
                      ),
                      Text(
                        "Last",
                        style: TextStyle(
                          color: buttondarkBlueClr,
                          fontFamily: 'Neometric',
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 60,
                    width: 120,
                    child: Text(
                      "Month",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Neometric',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: buttondarkPurpleClr,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Next",
                        style: TextStyle(
                          color: buttondarkBlueClr,
                          fontFamily: 'Neometric',
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: buttondarkBlueClr,
                        size: 16,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
