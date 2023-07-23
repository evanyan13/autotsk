/*
A file to store the list of quotes that will be displayed onto the UI of the onboarding pages
Reference used: https://www.oberlo.com/blog/motivational-quotes
*/
import 'package:flutter/material.dart';
import 'package:autotsk/util/font_style.dart';
import 'dart:math';

class ListOfQuotes {
  // for now, try to avoid quotes that are too long.
  final List<String> quoteList = [
    'The secret of getting ahead is getting started.',
    'The best time to plant a tree was 20 years ago. The second best time is now.',
    'You can either experience the pain of discipline or the pain of regret. The choice is yours.',
    'Your passion is waiting for your courage to catch up.',
    'Things may come to those who wait, but only the things left by those who hustle.',
    'Great things are done by a series of small things brought together.',
    'Some people want it to happen, some wish it would happen, others make it happen.',
  ];

  // A function to randomly generate a quote from the quoteList to display on the UI
  String randomQuote() {
    Random random = Random();
    int randomNum = random.nextInt(quoteList.length - 1);

    String randomQuote = quoteList[randomNum];
    return randomQuote;
  }

  // A text widget to display the quote onto the UI.
  Widget quoteDisplay() {
    return Text(
      randomQuote(),
      style: TextStyle(
        fontSize: 18,
        fontFamily: "Neometric",
        fontWeight: FontWeight.normal,
        letterSpacing: 1.5,
      ),
    );
  }
}
