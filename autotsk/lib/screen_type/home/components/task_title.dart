// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:autotsk/util/themes.dart';
import 'package:flutter/material.dart';

class TaskTitle extends StatelessWidget {
  const TaskTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        children: [
          SizedBox(
              height: 24,
              child: Stack(
                children: <Widget>[
                  Text(
                    "Today's Event",
                    style: headingStyleWhite,
                  ),
                ],
              )),
          Spacer(),
          TextButton(
            onPressed: () {},
            child: Text(
              "View All",
              style: bodyStyle,
            ),
          )
        ],
      ),
    );
  }
}
