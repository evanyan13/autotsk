import 'package:flutter/material.dart';
import 'package:autotsk/util/color.dart';
import 'package:autotsk/util/text_input_field.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(69, 48, 177, 1),
    );
  }
}
