import 'package:ev_station/size_config.dart';
import 'package:flutter/material.dart';


const primaryColor = Color.fromARGB(15, 75, 21, 161);
const primaryLightColor = Color(0xFFFECDEF);
const primaryGradientColor = LinearGradient(
  begin: Alignment.topRight,
  end: Alignment.bottomRight,
  colors: [
    Color(0xFFFFA53E),
    Color(0xFFFF7643),
  ],
);
const secondaryColor = Color(0xFF979797);
const textColor = Color(0xFF757575);


final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String emailNullError = "Please Enter your email";
const String invalidEmailError = "Please Enter Valid Email";
const String passNullError = "Please Enter your password";
const String shortPassError = "Password is too short";
const String matchPassError = "Passwords don't match";
const String namelNullError = "Please Enter your name";
const String phoneNumberNullError = "Please Enter your phone number";
const String addressNullError = "Please Enter your address";