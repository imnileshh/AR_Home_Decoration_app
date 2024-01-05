import 'package:ARhomes/screens/homeView.dart';
import 'package:ARhomes/screens/itemListScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserManagment {
  storeNewUser(UserCredential user, context) {
    print(user);
    FirebaseFirestore.instance.collection('/users').add({
      'email': user.user?.email,
      'uid': user.user?.uid,
      'displayName': user.user!.displayName,
      // 'phone': user.user?.phoneNumber,
    }).then((value) {
      Navigator.of(context).pop();
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => HomeView(),
      ));
    }).catchError((e) {
      print(e);
    });
  }
}
