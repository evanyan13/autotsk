import 'package:autotsk/auth/github_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../screen_type/home/home_page.dart';

class GitHubSignInButton extends StatefulWidget {
  @override
  _GitHubSignInButtonState createState() => _GitHubSignInButtonState();
}

class _GitHubSignInButtonState extends State<GitHubSignInButton> {

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      OutlinedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all(
              CircleBorder(),
            ),
          ),
          child: Image(
            image: AssetImage("assets/github-logo-round.png"),
            width: 56,
          ),
          onPressed: () async {
            UserCredential? userCredential =
                await GithubAuth.signInWithGithub(context: context);
            if (userCredential != null) {
              // Authentication successful
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            }
          }),
    ]);
  }
}
