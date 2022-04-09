import 'package:flutter/material.dart';
import '../../../otp/newuser/newuserotp.dart';
import '../../../otp/olduserotp.dart';

//TODOS: if we have newUser True --->
//TODOS: 1. Save user info to firebase.
//TODOS: 2. Save locally also

//TODOS: if we have newUser False --->
//TODOS: 1. Retrieve user info from firebase.
//TODOS: 2. Save locally also.

class OTPScreen extends StatefulWidget {
  final String phonenumber;
  final bool isNewUser;
  // final String userName;
  static String routename = "/otpscreen";
  const OTPScreen({
    Key? key,
    //required this.userName,
    required this.phonenumber,
    required this.isNewUser,
  }) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF091637),
      body: !widget.isNewUser
          ? OldUserOTPScreen(
              phone: widget.phonenumber,
            )

          //TODOS : CREATE ACCOUNT, IF USER IS NEW..

          : NewUserOTPScreen(
              phone: widget.phonenumber,
            ),
    );
  }
}
