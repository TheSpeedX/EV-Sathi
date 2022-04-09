import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screen/auth/authservices.dart';

FirebaseAuth firebaseAuth = FirebaseAuth.instance;
SharedPreferences? sharedPreferences;
  AuthClass authClass = AuthClass();
void showSnackBar(BuildContext context, String text) {
  final snakbar = SnackBar(
    content: Text(text),
    behavior: SnackBarBehavior.floating,
  );
  ScaffoldMessenger.of(context).showSnackBar(snakbar);
}
