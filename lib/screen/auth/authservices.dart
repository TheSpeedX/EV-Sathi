import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthClass {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //TODOS: Area of Verifying

  Future<void> verifyPhoneNumber(
    String phoneNumber,
    BuildContext context,
    Function setData,
  ) async {
    try {
      // ignore: prefer_function_declarations_over_variables
      PhoneVerificationCompleted phoneVerificationCompleted =
          (PhoneAuthCredential phoneAuthCredential) async {
        //showSnackBar(context, "Verification Completed");
        String s = phoneAuthCredential.token.toString();
        // ignore: avoid_print
        print(s);
      };
      // ignore: unused_local_variable, prefer_function_declarations_over_variables
      PhoneVerificationFailed phoneVerificationFailed =
          (FirebaseAuthException authException) {
        showSnackBar(context, authException.toString());
      };
      // ignore: prefer_function_declarations_over_variables
      PhoneCodeSent codeSent = (verificationId, forceResendingToken) async {
        showSnackBar(context, "Verification Code Sent Sucessfully");
        setData(verificationId);
      };
      // ignore: prefer_function_declarations_over_variables
      PhoneCodeAutoRetrievalTimeout phoneCodeAutoRetrievalTimeout =
          (verificationId) {
       // showSnackBar(context, "OTP must have arrived");
      };
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: phoneVerificationCompleted,
        verificationFailed: phoneVerificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: phoneCodeAutoRetrievalTimeout,
      );
      // ignore: empty_catches
    } catch (e) {
      print("here");
      showSnackBar(context, e.toString());
    }
  }

  //TODOS: Area of SigningIn

  Future<dynamic> signInWithPhoneNumber(
    String verificationId,
    String smsCode,
    BuildContext context,
    // String userName,
    String phonenumber,
  ) async {
    try {
      AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      // print(credential);
      return await _auth.signInWithCredential(credential);
    } catch (e) {
      //showSnackBar(context, "Wrong OTP entered");
    }

    return null;

  }

  void showSnackBar(BuildContext context, String text) {
    final snakbar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snakbar);
  }
}






























   