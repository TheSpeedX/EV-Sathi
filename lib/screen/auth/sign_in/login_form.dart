import 'package:flutter/material.dart';
import '../../../sidebar/components/headerforsign.dart';
import 'components/buildsigninbody.dart';

class LogInCumSignUpScreen extends StatefulWidget {
  static String routename = "/signSignUp";
  const LogInCumSignUpScreen({Key? key}) : super(key: key);

  @override
  State<LogInCumSignUpScreen> createState() => _LogInCumSignUpScreenState();
}

class _LogInCumSignUpScreenState extends State<LogInCumSignUpScreen> {
  TextEditingController phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
       //const Color.fromARGB(255, 50, 139, 87),
        body: Stack(
          children: const [
            HeaderForSign(),
            BuildBodySignIn(),
          ],
        ),
        );
  }
}