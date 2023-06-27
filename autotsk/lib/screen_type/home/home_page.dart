// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:autotsk/util/color.dart';
import 'package:autotsk/screen_type/home/components/body.dart';
import 'package:autotsk/screen_type/common_components/side_bar.dart';
import 'package:autotsk/screen_type/common_components/nav_bar.dart';
import 'package:autotsk/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String username = "";

  @override
  void initState() {
    super.initState();
    getUser();
  }

  void getUser() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    print(snap.data());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homePageBgDarkPurpleClr,
      appBar: buildAppBar(),
      drawer: SideBar(),
      body: Body(),
      bottomNavigationBar: NavBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Image.asset("assets/LogoLight.png"),
      centerTitle: true,
      backgroundColor: homePageBgDarkPurpleClr,
      elevation: 0,
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Transform.scale(
            scale: 0.8,
            child: CircleAvatar(
              radius: 24,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/profileAvatar.png"),
                radius: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
