// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:autotsk/util/color.dart';
import 'package:autotsk/screen_type/home/components/body.dart';
import 'package:autotsk/screen_type/side_bar.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:autotsk/screen_type/calendar_page.dart';
import 'package:autotsk/screen_type/to_do_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homePageBgDarkPurpleClr,
      appBar: buildAppBar(),
      drawer: SideBar(),
      body: Body(),
      bottomNavigationBar: Padding(
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
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Image.asset("assets/LogoLight.png"),
      centerTitle: true,
      backgroundColor: homePageBgDarkPurpleClr,
      elevation: 0,
      // leading: IconButton(
      //   icon: const Icon(Icons.menu_rounded),
      //   onPressed: () {},
      // ),
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
