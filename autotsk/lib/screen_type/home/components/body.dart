// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:autotsk/screen_type/home/components/meeting_event.dart';
import 'package:autotsk/screen_type/home/components/meeting_title.dart';
import 'package:flutter/material.dart';
import 'package:autotsk/screen_type/home/components/greetings_row.dart';
import 'package:autotsk/screen_type/home/components/task.content.dart';
import 'package:autotsk/screen_type/home/components/task_title.dart';
import 'package:autotsk/util/color.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homePageBgDarkPurpleClr,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GreetingRow(),
          Column(
            children: [
              TaskTitle(),
              TaskContent(),
            ],
          ),
          Column(
            children: [
              MeetingTitle(),
              MeetingEvent(),
            ],
          )
        ],
      ),
    );
  }
}
