import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../components/errordialog.dart';
import '../../../../components/loading_dialog.dart';
import '../../widgets/otpscreen.dart';

class BuildBodySignIn extends StatefulWidget {
  const BuildBodySignIn({Key? key}) : super(key: key);

  @override
  State<BuildBodySignIn> createState() => _BuildBodySignInState();
}

class _BuildBodySignInState extends State<BuildBodySignIn> {
  TextEditingController phoneController = TextEditingController();
  //TODOS: VALIDATE FORM
    void validateForm() async {
    if (phoneController.text.length == 10) {
      showDialog(
          context: context,
          builder: (context) {
            return const LoadingDialog(
              message: "",
            );
          });
      checkUserExistOrNot();
      // await Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => OTPScreen(
      //       phonenumber: phone.text.toString(),
      //       // userName: (firstname.text + secondname.text).toString(),
      //     ),
      //   ),
      // );
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return const ErrorDialog(
              message: "Phone Number is of 10 digits",
            );
          });
    }
  }

  //TODOS: validate Ends

  //TODOS: CHECKUSER START

  void checkUserExistOrNot() async {
    // User? currentUser = firebaseAuth.currentUser;
    await FirebaseFirestore.instance
        .collection("phone")
        .doc(phoneController.text)
        .get()
        .then((value) async {
      if (value.exists) {
        //if user is  already there in firebase
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (c) => OTPScreen(
              phonenumber: phoneController.text,
              isNewUser: false,
              //false means user data will be there in firestore,fetch data
              //from there and saved to sharedpref to use locally.
            ),
            //send true to otpscreen
          ),
        );
      } else {
        //if user is not registered
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (c) => OTPScreen(
              phonenumber: phoneController.text,
              isNewUser: true,
              //true means user data not there so take data from user in other screen
              //and save to firestore and shredpref store data locally.
            ),
            //send false to otpscreen.
          ),
        );
      }
    });
  }

//TODOS: CHECK USER ENDS

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Positioned(
      top: size.height * 0.3,
      bottom: 0,
      left: size.width * 0.0002,
      right: size.width * 0.0002,
      child: SizedBox(
        // color: Colors.red,
        child: Padding(
          padding: const EdgeInsets.only(left: 50.0, right: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/images/login.gif"),
              const Text(
                "Welcome",
                style: TextStyle(fontSize: 30.0, fontFamily: "Lobster"),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Form(
                child: TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.number,
                  cursorHeight: 20,
                  decoration: const InputDecoration(
                    labelText: "Mobile Number",
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: () {
                  validateForm();
                },
                child: SizedBox(
                  height: size.height * 0.06,
                  width: double.infinity,
                  child: const Center(
                    child: Text(
                      "Request for OTP",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
