import 'package:ev_station/Screen/Splash/splash.dart';
import 'package:ev_station/screen/auth/sign_in/login_form.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName : (context) => const SplashScreen(),
  //SignInScreen.routeName :(context) =>  const SignInScreen(),
  // OTPScreen.routename : ((context) =>  OTPScreen()),
  LogInCumSignUpScreen.routename : ((context) => const LogInCumSignUpScreen()),
};
