import 'package:flutter/material.dart';

class SignUpComp extends StatefulWidget {
  const SignUpComp({super.key});

  @override
  State<SignUpComp> createState() => _SignUpCompState();
}

class _SignUpCompState extends State<SignUpComp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text(
          'Sign Up completed',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
