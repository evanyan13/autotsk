// ignore_for_file: prefer_const_constructors
import 'package:autotsk/onboarding/ob1.dart';
import 'package:autotsk/onboarding/ob2.dart';
import 'package:autotsk/onboarding/ob3.dart';
import 'package:autotsk/util/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:autotsk/screen_type/signin_page.dart';
import 'package:autotsk/screen_type/signup_page.dart';
import 'package:autotsk/add_task/addtask_page.dart';
import 'package:autotsk/onboarding/pageview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:autotsk/screen_type/home/home_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  // no need to config for web version  of  the app.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      routes: {
        '/ob1': (context) => OnboardingFirst(),
        '/ob2': (context) => OnboardingSecond(),
        '/ob3': (context) => OnboardingThird(),
        '/signin': (context) => Signin(),
        '/signup': (context) => SignUp(),
        '/onboarding': (context) => PageV(),
        '/addtaskform': (context) => AddTask(),
        '/home': (context) => HomePage(),
      },
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            // User has been authenticated, proceed to sign in to Home Page
            if (snapshot.hasData) {
              return HomePage();
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

          // Default shows Onboarding Page
          return const OnboardingFirst();
        },
      ),
      theme: ThemeData(
        scaffoldBackgroundColor: mainLightBgColour2,
        primaryColor: buttondarkPurpleClr,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.black),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
