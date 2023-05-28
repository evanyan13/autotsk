import 'package:flutter/material.dart';

class LoginComp extends StatefulWidget {
  const LoginComp({super.key});

  @override
  State<LoginComp> createState() => _LoginCompState();
}

class _LoginCompState extends State<LoginComp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text(
          'Logged in successfully',
          style: TextStyle(
            fontSize: 35.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
