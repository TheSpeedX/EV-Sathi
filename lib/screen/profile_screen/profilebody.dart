import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ev_station/components/loading_dialog.dart';
import 'package:ev_station/screen/profile_screen/profile_created.dart';
import 'package:flutter/material.dart';
import 'package:ev_station/components/errordialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../global.dart';

class BuildProfileBody extends StatefulWidget {
  final String phoneNumber;
  const BuildProfileBody({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  State<BuildProfileBody> createState() => _BuildProfileBodyState();
}

class _BuildProfileBodyState extends State<BuildProfileBody> {
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController pincode = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Positioned(
      top: size.height * 0.2,
      bottom: 0,
      left: size.width * 0.0002,
      right: size.width * 0.0002,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        // color: Colors.red,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 50.0, right: 50.0),
            child: Column(
              children: [
                TextField(
                  controller: firstName,
                  keyboardType: TextInputType.name,
                  cursorHeight: 20,
                  decoration: InputDecoration(
                    labelText: "First Name *",
                    labelStyle: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                TextField(
                  controller: lastName,
                  keyboardType: TextInputType.name,
                  cursorHeight: 20,
                  decoration: InputDecoration(
                    labelText: "Last Name *",
                    labelStyle: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // CustomTextFieldprofile(
                //   controller: lastName,
                //   hintName: "Last Name *",
                //   keyboardtype: TextInputType.name,
                // ),
                const SizedBox(
                  height: 30.0,
                ),
                TextField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  cursorHeight: 20,
                  decoration: InputDecoration(
                    labelText: "Email *",
                    labelStyle: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // CustomTextFieldprofile(
                //   controller: email,
                //   hintName: "Email *",
                //   keyboardtype: TextInputType.name,
                // ),
                const SizedBox(
                  height: 30.0,
                ),
                TextField(
                  controller: pincode,
                  keyboardType: TextInputType.number,
                  cursorHeight: 20,
                  decoration: InputDecoration(
                    labelText: "PIN Code of your address *",
                    labelStyle: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // CustomTextFieldprofile(
                //   controller: pincode,
                //   hintName: "PIN Code of your address *",
                //   keyboardtype: TextInputType.name,
                // ),
                const SizedBox(
                  height: 30.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    //validateForm();
                    //TODOS: Send to account sucessfully created screen.
                    //TODOS : on continue button clicked.
                    validateForm(context);
                  },
                  child: SizedBox(
                    height: size.height * 0.06,
                    width: double.infinity,
                    child: const Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateForm(BuildContext context) async {
    if (firstName.text.isNotEmpty &&
        lastName.text.isNotEmpty &&
        email.text.isNotEmpty &&
        pincode.text.isNotEmpty) {
      showDialog(
          context: context,
          builder: (context) {
            return const LoadingDialog(message: "",);
          });
      await saveDataToFirebase(context);
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return const ErrorDialog(
              message: "Please fill all details",
            );
          });
    }
  }

  saveDataToFirebase(BuildContext context) async {

    //TODOS: SETTING WILL BE HAPPEN AFTER VECHICLE ADDITION.
    //TODOS: IF NEW USER LEFT VECH ADD AND CLOSE APP THEN AGAIN HE/SHE HAVE TO FILL THIS.
    // await FirebaseFirestore.instance
    //     .collection("phone")
    //     .doc(widget.phoneNumber)
    //     .set(
    //       ({
    //         "userEmail": email.text.trim(),
    //         "fullName": firstName.text.trim() + " " + lastName.text.trim(),
    //         "phoneNumber": widget.phoneNumber.trim(),
    //         "pincode": pincode.text.trim(),
    //       }),
    //     );

    SharedPreferences? sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setString("email", email.text.trim());
    await sharedPreferences.setString(
        "name", firstName.text.trim() +" " + lastName.text.trim());
    await sharedPreferences.setString("phoneNumber", widget.phoneNumber);
    await sharedPreferences.setString("pincode", pincode.text.trim());
    Navigator.pop(context);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) =>  ProfileCreated(number: widget.phoneNumber),
      ),
      (route) => false,
    );
   // showSnackBar(context, "LoggedIn Sucessfully");
    // }
  }
}
