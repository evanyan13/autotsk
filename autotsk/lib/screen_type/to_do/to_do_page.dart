// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import "package:flutter/material.dart";
import "package:autotsk/util/color.dart";
import 'package:autotsk/screen_type/common_components/side_bar.dart';
import 'package:autotsk/screen_type/common_components/nav_bar_dark.dart';

class ToDoPage extends StatelessWidget {
  const ToDoPage({super.key});

  Widget catTaskCont(String task, int numTask) {
    return Container(
      child: Container(
        height: 100,
        width: 150,
        child: Column(
          children: [
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                SizedBox(width: 20),
                Text(
                  '$task',
                  style: TextStyle(
                    color: buttondarkBlueClr,
                    fontFamily: "Neometric",
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SizedBox(height: 11),
            Row(
              children: [
                SizedBox(width: 20),
                Text(
                  numTask <= 1 ? '$numTask Task' : '$numTask Tasks',
                  style: TextStyle(
                    color: buttondarkBlueClr,
                    fontFamily: "Neometric",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      height: 80,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
        color: offWhiteColor,
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
    );
  }

  Widget taskCont(String task, int numTask) {
    return Container(
      child: Container(
        height: 100,
        width: 325,
        child: Column(
          children: [
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                SizedBox(width: 20),
                Text(
                  '$task',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 11),
            Row(
              children: [
                SizedBox(width: 20),
                Text(
                  numTask <= 1 ? '$numTask Task' : '$numTask Tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Neometric",
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      height: 80,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
        color: homePageBgDarkPurpleClr,
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: mainLightBgColour,
        drawer: SideBar(),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 15),
                taskCont('Today', 1),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        catTaskCont('Run', 3),
                        SizedBox(height: 20),
                        catTaskCont('Fly', 4),
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      children: [
                        catTaskCont('Meetings', 3),
                        SizedBox(height: 20),
                        catTaskCont('Work', 4),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Row(
                  children: [
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      "Most Important Tasks",
                      style: TextStyle(
                        fontFamily: 'Neometric',
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Container(
                  height: 100,
                  width: 325,
                  decoration: BoxDecoration(
                    color: homePageBgLightPurpleClr,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  height: 100,
                  width: 325,
                  decoration: BoxDecoration(
                    color: homePageBgLightPurpleClr,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  height: 100,
                  width: 325,
                  decoration: BoxDecoration(
                    color: homePageBgLightPurpleClr,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // bottomNavigationBar: NavBarDark(),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Image.asset("assets/logobg.png"),
      centerTitle: true,
      backgroundColor: mainLightBgColour,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
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
