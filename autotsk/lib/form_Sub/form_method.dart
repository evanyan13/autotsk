import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddFormMethod {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> AddFormtoDB({
    required String uid,
    required String title,
    required String date,
    required String priority,
    required String category,
    required String location,
    required String notes,
  }) async {
    String res = "success";
    CollectionReference listOfUsers = _firestore.collection('users');
    try {
      if (title.isNotEmpty ||
          date.isNotEmpty ||
          priority.isNotEmpty ||
          category.isNotEmpty) {}
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
