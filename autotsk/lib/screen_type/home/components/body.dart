// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:autotsk/util/color.dart';
import 'package:flutter/material.dart';
import 'package:autotsk/screen_type/home/components/greetings_row.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    var time = DateTime.now;

    return SingleChildScrollView(
      child: Column(children: <Widget>[
        greetings_row(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            children: [
              Container(
                  height: 24,
                  child: Stack(
                    children: <Widget>[
                      Text(
                        "Today's Event",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Neometric',
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 4,
                          color: homePageBgLightPurpleClr.withOpacity(0.4),
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
        )
      ]),
    );
  }
}
