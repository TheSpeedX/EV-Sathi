import 'package:ev_sathi/screen/Splash/splash.dart';
import 'package:ev_sathi/screen/auth/sign_in/login_form.dart';
import 'package:ev_sathi/screen/auth/widgets/otpscreen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName : (context) => const SplashScreen(),
  LogInCumSignUpScreen.routename :(context) =>  const LogInCumSignUpScreen(),
  //OTPScreen.routename : ((context) =>  OTPScreen()),
  // LogInCumSignUpScreen.routename : ((context) => const LogInCumSignUpScreen()),
};
