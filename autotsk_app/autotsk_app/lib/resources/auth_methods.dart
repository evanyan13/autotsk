import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // sign up user
  // create a sign up method function
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    // required Uint8List file,
  }) async {
    String response = 'error';

    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty) {
        // file != null) {
        // register user
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
            email: email, password: password);

        // add other user info to our database.
        // set will over the existing data if it already exists
        await _firestore.collection('users').doc(userCredential.user!.uid).set({
          'username': username,
          'uid': userCredential.user!.uid,
          'email': email,
          'bio': bio,
          'followers': {},
          'following': {},
        });

        /* await _firestore.collection('users').add(
          'username': username,
          'uid': userCredential.user!.uid,
          'email': email,
          'bio': bio,
          'followers': {},
          'following': {},
        ); */

        response = 'success';
      }
    } catch (e) {
      response = e.toString();
    }

    return response;
  }
}
