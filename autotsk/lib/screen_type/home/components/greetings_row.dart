// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import "package:flutter/material.dart";
import 'package:intl/intl.dart';

class GreetingRow extends StatelessWidget {
  const GreetingRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi Zhong Kai!",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Neometric',
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      DateFormat("yMMMEd").format(DateTime.now()),
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Neometric',
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
