// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api

import 'package:autotsk/auth/google_auth.dart';
import 'package:autotsk/screen_type/home/home_page.dart';
import 'package:autotsk/screen_type/signin_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GoogleSignInButton extends StatefulWidget {
  @override
  _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // _isSigningIn
        //   ? CircularProgressIndicator(
        //       valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        //     )
        //   : 
          OutlinedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(
                  CircleBorder(
                  
                  ),
                ),
              ),
              child: Image(
                image: AssetImage("assets/Googleicon.png"),
                height: 56.0,
              ),

              onPressed: () async {
                setState(() {
                  _isSigningIn = true;
                });

                User? user =
                    await GoogleAuth.signInWithGoogle(context: context);

                setState(() {
                  _isSigningIn = false;
                });

                if (user != null) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                } else {
                  setState(() {
                  _isSigningIn = false;
                  });
                }
              },
            ),
      ]
    );
  }
}
