// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import "package:flutter/material.dart";
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GreetingRow extends StatefulWidget {
  const GreetingRow({super.key});

  @override
  State<GreetingRow> createState() => _GreetingRowState();
}

class _GreetingRowState extends State<GreetingRow> {
  String username = "";

  @override
  void initState() {
    super.initState();
    getUsername();
  }

  void getUsername() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    setState(() {
      username = (snap.data()! as Map<String, dynamic>)['username'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi $username!",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Neometric',
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      DateFormat("yMMMEd").format(DateTime.now()),
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Neometric',
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '${DateFormat('hh : mm a').format(DateTime.now())}',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Neometric',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
