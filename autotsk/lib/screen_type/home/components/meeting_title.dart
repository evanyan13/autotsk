// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class MeetingTitle extends StatelessWidget {
  const MeetingTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        children: [
          SizedBox(
              height: 35,
              child: Stack(
                children: <Widget>[
                  Text(
                    "Meetings",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Neometric',
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ],
              )),
          Spacer(),
          TextButton(
            onPressed: () {},
            child: Text(
              "View All",
              style: TextStyle(
                fontFamily: 'Neometric',
                fontWeight: FontWeight.normal,
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
