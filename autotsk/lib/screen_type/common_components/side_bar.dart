// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:autotsk/util/color.dart';
import 'package:autotsk/screen_type/calendar/calendar_page.dart';
import 'package:autotsk/screen_type/to_do/to_do_page.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
            color: homePageBgDarkPurpleClr,
            child: ListView(children: [
              UserAccountsDrawerHeader(
                accountName: Text(
                  "Zhong Kai",
                  style: TextStyle(
                    fontFamily: 'Neometric',
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                accountEmail: Text("tayzhongkai@gmail.com",
                    style: TextStyle(
                      fontFamily: 'Neometric',
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                    )),
                currentAccountPicture: CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/profileAvatar.png"),
                      radius: 32,
                    )),
                decoration: BoxDecoration(
                  color: homePageBgDarkPurpleClr,
                ),
              ),
              ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Setting",
                    style: TextStyle(
                      fontFamily: 'Neometric',
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CalendarPage()));
                  }),
              ListTile(
                  leading: Icon(
                    Icons.share_rounded,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Share",
                    style: TextStyle(
                      fontFamily: 'Neometric',
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ToDoPage()));
                  }),
              ListTile(
                  leading: Icon(
                    Icons.feedback_rounded,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Send Feedback",
                    style: TextStyle(
                      fontFamily: 'Neometric',
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  trailing: ClipOval(
                    child: Container(
                      color: Colors.red,
                      width: 20,
                      height: 20,
                      child: Center(
                          child: Text(
                        "2",
                        style: TextStyle(
                          fontFamily: 'Neometric',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      )),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ToDoPage()));
                  }),
              ListTile(
                  leading: Icon(
                    Icons.help,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Help",
                    style: TextStyle(
                      fontFamily: 'Neometric',
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ToDoPage()));
                  }),
              ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Log Out",
                    style: TextStyle(
                      fontFamily: 'Neometric',
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ToDoPage()));
                  }),
            ])));
  }
}
