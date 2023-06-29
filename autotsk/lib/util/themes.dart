import 'package:autotsk/util/color.dart';
import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData(
    // scaffoldBackgroundColor: mainLightBgColour,
    primaryColor: Colors.white,
    brightness: Brightness.light,
    // textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.black),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static final dark = ThemeData(
    // scaffoldBackgroundColor: homePageBgDarkPurpleClr,
    primaryColor: Colors.white,
    brightness: Brightness.dark,
    // textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.black),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
