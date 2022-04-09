import 'dart:async';
import 'package:flutter/material.dart';
import '../../global.dart';
import '../../size_config.dart';
import '../dashboard.dart';
import 'components/body.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static String routeName = "/splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  setTimer() {
    Timer(const Duration(seconds: 2), () async {
      //eg fushing to body without any check for demo
      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => const Body()));
      if (firebaseAuth.currentUser != null) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const DashBoard(),
          ),
          (route) => false,
        );
      } else {
        //firebaseAuth.signOut();
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const Body(),
          ),
          (route) => false,
        );
      }
      //TODOS: If firebase have user then send to home page otherwise se
      //TODOS: nd to Splash 1-3 page to sign In.(call BODY)
    });
  }

  @override
  void initState() {
    super.initState();
    setTimer();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "EV",
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 44, 109, 162),
                    ),
                  ),
                  Text(
                    " Sathi",
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Color.fromARGB(255, 45, 138, 214),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const Divider(
                thickness: 2.5,
                color: Colors.green,
                indent: 130.0,
                endIndent: 130.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "ez",
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 44, 109, 162),
                      ),
                    ),
                    Text(
                      " CHARGE",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Color.fromARGB(255, 45, 138, 214),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Image.asset(
                "assets/images/adad.png",
              ),
              const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
