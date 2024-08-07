import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egy_exlpor/core/models/user.dart';
import 'package:egy_exlpor/features/auth/presentation/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Authentication {
  getUserDetails() async {
    User currentUser = FirebaseAuth.instance.currentUser!;
    DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(currentUser.uid).get();
    return UserModel.fromDocument(documentSnapshot);
  }

  Future<String> createUserWithEmailAndPassword(
      {required String email,
      required String pass,
      required String userName,
      required String phoneNumber,
      required String countryCode,
      }) async {
    String message = '';
    try {
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      UserModel userModel = UserModel(
        userId: userCredential.user!.uid,
        userName: userName,
        email: email,
        password: pass,
        profilePic: '',
        phoneNumber: phoneNumber,
        countryCode: countryCode,
      );
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set(userModel.toJson());
      message = 'success';
      return message;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email';
        log('The account already exists for that email');
      } else if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
        log('The password provided is too weak.');
      } else {
        message = "Error ${e.code}";
        log("Error ${e.code}");
      }
    } catch (e) {
      message = e.toString();
      log(e.toString());
    }
    return message;
  }

  Future<String> signInWithEmailAndPassword(
      {required String email, required String pass}) async {
    String message = '';

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);
      message = 'success';
      return message;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        message = 'No user found for that email.';
        log('No user found for that email.');
      } else if (e.code == 'invalid-credential') {
        message = 'Wrong password provided for that user.';
        log('Wrong password provided for that user.');
      } else {
        message = "Error ${e.code}";
        log("Error ${e.code}");
      }
    } catch (e) {
      message = e.toString();
      log(e.toString());
    }
    return message;
  }

  Future<void> signOut(context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginView(),
        ),
        (route) => false);
  }
}
