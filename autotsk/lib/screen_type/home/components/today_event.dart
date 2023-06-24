// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:autotsk/screen_type/calendar_page.dart';
import 'package:flutter/material.dart';

class TodayEvent extends StatelessWidget {
  const TodayEvent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: TodayEventCards(
          image: "assets/Person1.png",
          title: "Task 1",
          press: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CalendarPage(),
              ),
            );
          },
        ));
  }
}

class TodayEventCards extends StatelessWidget {
  const TodayEventCards(
      {super.key,
      required this.image,
      required this.title,
      required this.press});

  final String image, title;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 50,
                color: Colors.black.withOpacity(0.25),
              ),
            ]),
        child: Row(
          children: [
            RichText(
                text: TextSpan(
                    text: title,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Neometric',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    )))
          ],
        ));
  }
}
