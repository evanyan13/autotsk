// ignore_for_file: prefer_const_constructors

import 'package:autotsk/screen_type/calendar/calendar_page.dart';
import 'package:flutter/material.dart';
import 'package:autotsk/util/color.dart';
import 'package:autotsk/screen_type/signin_page.dart';
import 'package:autotsk/screen_type/signup_page.dart';
import 'package:autotsk/screen_type/home/home_page.dart';
import 'package:autotsk/onboarding/ob1.dart';
import 'package:autotsk/onboarding/ob2.dart';
import 'package:autotsk/onboarding/ob3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: mainLightBgColour2,
        primaryColor: darkPurpleClr,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.white),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CalendarPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
