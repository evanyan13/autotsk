// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

import 'package:autotsk/screen_type/home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:github_sign_in_plus/github_sign_in_plus.dart';

class GithubAuth {
  // To initialize Firebase storage
  static Future<FirebaseApp> initializeFirebase({required BuildContext context}) async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    }
    return firebaseApp;
  }

  // Sign in method
  static Future<UserCredential?> signInWithGithub({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    UserCredential? user;

    final GitHubSignIn gitHubSignIn = GitHubSignIn(
      clientId: "ad156d12738ddb54ba1c",
      clientSecret: "678515568e95b153bfd73bf7422006cdd5dae21e",
      redirectUrl: "https://autotsk-e8bb3.firebaseapp.com/__/auth/handler",
      title: "Log In with GitHub",
      centerTitle: true,
    );

    var result = await gitHubSignIn.signIn(context);
    switch (result.status) {
      case GitHubSignInResultStatus.ok:
        print(result.token);
        return user;

      case GitHubSignInResultStatus.cancelled:
      case GitHubSignInResultStatus.failed:
        print(result.errorMessage);
        return null;
    }
  }
}
