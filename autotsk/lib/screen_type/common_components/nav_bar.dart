// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:autotsk/util/color.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;

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
              selectedColor: Colors.lightBlue,
              unselectedColor: Colors.white,
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.calendar_month),
              title: Text("Calendar"),
              selectedColor: Colors.lightBlue,
              unselectedColor: Colors.white,
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.list_rounded),
              title: Text("To-Do"),
              selectedColor: Colors.lightBlue,
              unselectedColor: Colors.white,
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.alarm_rounded),
              title: Text("Reminder"),
              selectedColor: Colors.lightBlue,
              unselectedColor: Colors.white,
            ),
          ]),
    );
  }
}
