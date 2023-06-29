import 'package:autotsk/util/color.dart';
import 'package:autotsk/util/swatch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Themes {
  static final lightMode = ThemeData(
    scaffoldBackgroundColor: mainLightBgColour,
    primarySwatch: Swatch.blue,
    brightness: Brightness.light,
    // // textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.black),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static final darkMode = ThemeData(
    // scaffoldBackgroundColor: homePageBgDarkPurpleClr,
    primarySwatch: Colors.lightBlue,
    brightness: Brightness.dark,
    // textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.black),
    // visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

TextStyle get headingStyleWhite {
  return TextStyle(
    color: Colors.white,
    fontFamily: 'Neometric',
    fontWeight: FontWeight.bold,
    fontSize: 24,
  );
}

TextStyle get bodyStyle {
  return TextStyle(
    fontFamily: 'Neometric',
    fontWeight: FontWeight.normal,
    fontSize: 16,
  );
}
