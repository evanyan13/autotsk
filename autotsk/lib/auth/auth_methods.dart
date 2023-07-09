import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUpUser({
    required String username,
    required String email,
    required String password,
  }) async {
    String res = "an Error occured";
    try {
      // validate the input
      if (email.isNotEmpty || username.isNotEmpty || password.isNotEmpty) {
        // register user
        UserCredential userCred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        // add user to firestore db
        await _firestore.collection('users').doc(userCred.user!.uid).set({
          'username': username,
          'uid': userCred.user!.uid,
          'email': email,
        });
        res = "success";
      }
    } on FirebaseAuthException catch (err) {
      if (err.code == "invalid-email") {
        res = "please key in a valid email address";
      }

      if (err.code == "weak-password") {
        res = "enter a stronger password";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> LoginUser({
    required String email,
    required String password,
  }) async {
    String resp = "an Error occured";

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        resp = "success";
      } else {
        resp = "Please enter all the fields";
      }
    } on FirebaseAuthException catch (err) {
      if (err.code == 'user-not-found') {
        resp = "user not found";
      }
    } catch (err) {
      resp = err.toString();
    }

    return resp;
  }
}
