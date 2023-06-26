// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:autotsk/util/color.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class NavBarDark extends StatefulWidget {
  const NavBarDark({super.key});

  @override
  State<NavBarDark> createState() => _NavBarDarkState();
}

class _NavBarDarkState extends State<NavBarDark> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
            SalomonBottomBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
              selectedColor: Colors.blue,
              unselectedColor: Colors.white,
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.calendar_month),
              title: Text("Calendar"),
              selectedColor: Colors.blue,
              unselectedColor: Colors.white,
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.list_rounded),
              title: Text("To-Do"),
              selectedColor: Colors.blue,
              unselectedColor: Colors.white,
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.alarm_rounded),
              title: Text("Reminder"),
              selectedColor: Colors.blue,
              unselectedColor: Colors.white,
            ),
          ]),
    );
  }
}
