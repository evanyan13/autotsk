import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:autotsk/form_Sub/add_form_db.dart';

class AddFormMethod {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> AddFormtoUserDb({
    required String uid,
    required String title,
    required String date,
    required String priority,
    required String location,
    required String notes,
  }) async {
    String res = "success";
    CollectionReference listOfUsers = _firestore.collection('users');
    try {
      if (title.isNotEmpty || date.isNotEmpty || priority.isNotEmpty) {
        // get main user collection first
        listOfUsers.doc(uid).collection('tasks').add({
          'uid': uid,
          'title': title,
          'date': date,
          'priority': priority,
          'location': location,
          'notes': notes,
        });
        // get user uid
        // add to subcollection
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
