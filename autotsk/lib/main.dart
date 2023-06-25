import 'package:autotsk/onboarding/ob1.dart';
import 'package:autotsk/onboarding/ob2.dart';
import 'package:autotsk/onboarding/ob3.dart';
import 'package:autotsk/util/color.dart';
import 'package:flutter/material.dart';
import 'package:autotsk/screen_type/signin_page.dart';
import 'package:autotsk/screen_type/signup_page.dart';
import 'package:autotsk/screen_type/home_page.dart';
import 'package:autotsk/screen_type/addtask_page.dart';
import 'package:autotsk/onboarding/pageview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // no need to config for web version  of  the app.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/ob1': (context) => OnboardingFirst(),
        '/ob2': (context) => OnboardingSecond(),
        '/ob3': (context) => OnboardingThird(),
        '/signin': (context) => Signin(),
        '/signup': (context) => SignUp(),
        '/onboarding': (context) => PageV(),
        '/addtaskform': (context) => AddTask(),
      },
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            // it means user has been authenticated
            if (snapshot.hasData) {
              print(snapshot.data);
              return AddTask();
            } else if (snapshot.hasError) {
              return Center(child: Text('${snapshot.error}'));
            }
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: mainLightBgColour,
              ),
            );
          }

          return const OnboardingFirst();
        },
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
