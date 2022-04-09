// ignore: import_of_legacy_library_into_null_safe
import 'package:curved_splash_screen/curved_splash_screen.dart';
import 'package:ev_sathi/screen/Splash/components/splash_content.dart';
import 'package:flutter/material.dart';

import '../../auth/sign_in/login_form.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Color> color = [
    Colors.white,
    Colors.white,
    Colors.white,
    const Color(0xFFEFE0F3),
  ];
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Find Your Nearest Charging Station with Navigation",
      "image": "assets/images/q.png"
    },
    {
      "text": "Manage all your Vehicle need at one place",
      "image": "assets/images/mm.png"
    },
    {
      "text": "Book Slot, Payment and get Rewards",
      "image": "assets/images/ass.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CurvedSplashScreen(
        backText: "Back",
        backgroundColor: Colors.transparent,
        screensLength: splashData.length,
        screenBuilder: (index) {
          return SplashContent(
            image: splashData[index]["image"].toString(),
            text: splashData[index]["text"].toString(),
            color: color[index],
          );
        },
        onSkipButton: () {
          // ignore: avoid_print
          Navigator.pushNamed(
            context,
            LogInCumSignUpScreen.routename,
          );
        },
      ),
    ); 
  }
}
