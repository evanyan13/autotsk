import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:autotsk_app/responsive/mobile_screen_layout.dart';
import 'package:autotsk_app/responsive/res_screen_layout.dart';
import 'package:autotsk_app/responsive/web_screen_layout.dart';
import 'package:autotsk_app/screen_type/login_screen.dart';
import 'package:autotsk_app/utilities/colors_scheme.dart';
import 'package:autotsk_app/screen_type/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      // options widget to configure with Firestore
      options: const FirebaseOptions(
        apiKey: 'AIzaSyAbBh1KrDsabY9E6eQ8JaZlMBN09bIwdvI',
        appId: '1:137691831597:web:13900df4338db6784e47a4',
        messagingSenderId: '137691831597',
        projectId: 'autotsk-33596',
        storageBucket: 'autotsk-33596.appspot.com',
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Clone',

      // will use all the dark colors
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      // home: ResponsiveLayout(
      //   mobileScreenLayout: MobileScreenLayout(),
      //   webScreenLayout: WebScreenLayout(),
      // ),
      home: SignUpScreen(),
    );
  }
}
