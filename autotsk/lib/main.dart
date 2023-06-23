import 'package:autotsk/onboarding/ob1.dart';
import 'package:autotsk/onboarding/ob2.dart';
import 'package:autotsk/onboarding/ob3.dart';
import 'package:flutter/material.dart';
import 'package:autotsk/screen_type/signin_page.dart';
import 'package:autotsk/screen_type/signup_page.dart';
import 'package:autotsk/screen_type/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUp(),
      debugShowCheckedModeBanner: false,
    );
  }
}
