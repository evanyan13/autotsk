// ignore_for_file: prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:autotsk/util/color.dart';
import 'package:autotsk/screen_type/calendar/calendar_page.dart';
import 'package:autotsk/screen_type/to_do/to_do_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  String username = "";
  String email = "";

  void getUsernameandEmail() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    setState(() {
      username = (snap.data()! as Map<String, dynamic>)['username'];
      email = (snap.data()! as Map<String, dynamic>)['email'];
    });
  }

  @override
  void initState() {
    super.initState();
    getUsernameandEmail();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.white,
        child: Container(
            color: homePageBgDarkPurpleClr,
            child: ListView(children: [
              UserAccountsDrawerHeader(
                accountName: Text(
                  "$username",
                  style: TextStyle(
                    fontFamily: 'Neometric',
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                accountEmail: Text(
                  "$email",
                  style: TextStyle(
                    fontFamily: 'Neometric',
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                ),
                currentAccountPicture: CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/profileAvatar.png"),
                      radius: 32,
                    )),
                decoration: BoxDecoration(
                  color: homePageBgDarkPurpleClr,
                ),
              ),
              ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Setting",
                    style: TextStyle(
                      fontFamily: 'Neometric',
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CalendarPage()));
                  }),
              ListTile(
                  leading: Icon(
                    Icons.share_rounded,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Share",
                    style: TextStyle(
                      fontFamily: 'Neometric',
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ToDoPage()));
                  }),
              ListTile(
                  leading: Icon(
                    Icons.feedback_rounded,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Send Feedback",
                    style: TextStyle(
                      fontFamily: 'Neometric',
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  trailing: ClipOval(
                    child: Container(
                      color: Colors.red,
                      width: 20,
                      height: 20,
                      child: Center(
                          child: Text(
                        "2",
                        style: TextStyle(
                          fontFamily: 'Neometric',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      )),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ToDoPage()));
                  }),
              ListTile(
                  leading: Icon(
                    Icons.help,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Help",
                    style: TextStyle(
                      fontFamily: 'Neometric',
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ToDoPage()));
                  }),
              ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Log Out",
                    style: TextStyle(
                      fontFamily: 'Neometric',
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ToDoPage()));
                  }),
              ListTile(
                  leading: Icon(
                    Icons.nightlight_round,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Switch Theme",
                    style: TextStyle(
                      fontFamily: 'Neometric',
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  onTap: () {
                    print("Tapped");
                  }),
            ])));
  }
}
