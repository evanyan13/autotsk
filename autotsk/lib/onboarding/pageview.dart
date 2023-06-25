import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:autotsk/screen_type/signup_page.dart';
import 'package:autotsk/screen_type/signin_page.dart';
import 'package:autotsk/screen_type/addtask_page.dart';
import 'package:autotsk/onboarding/ob1.dart';
import 'package:autotsk/onboarding/ob2.dart';
import 'package:autotsk/onboarding/ob3.dart';

class PageV extends StatefulWidget {
  const PageV({super.key});

  @override
  State<PageV> createState() => _PageVState();
}

class _PageVState extends State<PageV> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      children: <Widget>[
        OnboardingFirst(),
        OnboardingSecond(),
        OnboardingThird(),
      ],
    );
  }
}
