import 'package:ev_station/sidebar/components/headerforsign.dart';
import 'package:flutter/material.dart';
import 'components/buildsigninbody.dart';

class LogInCumSignUpScreen extends StatefulWidget {
  static String routename = "/signSignUp";
  const LogInCumSignUpScreen({Key? key}) : super(key: key);

  @override
  State<LogInCumSignUpScreen> createState() => _LogInCumSignUpScreenState();
}

class _LogInCumSignUpScreenState extends State<LogInCumSignUpScreen> {
  TextEditingController phone = TextEditingController();

  // void validateForm() async {
  //   if (phone.text.length == 10) {
  //     showDialog(
  //         context: context,
  //         builder: (context) {
  //           return const LoadingDialog(
  //             message: "",
  //           );
  //         });
  //     checkUserExistOrNot();
  //     // await Navigator.pushReplacement(
  //     //   context,
  //     //   MaterialPageRoute(
  //     //     builder: (context) => OTPScreen(
  //     //       phonenumber: phone.text.toString(),
  //     //       // userName: (firstname.text + secondname.text).toString(),
  //     //     ),
  //     //   ),
  //     // );
  //   } else {
  //     showDialog(
  //         context: context,
  //         builder: (context) {
  //           return const ErrorDialog(
  //             message: "Phone Number is of 10 digits",
  //           );
  //         });
  //   }
  // }

  // void checkUserExistOrNot() async {
  //   // User? currentUser = firebaseAuth.currentUser;
  //   await FirebaseFirestore.instance
  //       .collection("phone")
  //       .doc(phone.text)
  //       .get()
  //       .then((value) async {
  //     if (value.exists) {
  //       //if user is  already there in firebase
  //       Navigator.pop(context);
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (c) => OTPScreen(
  //             phonenumber: phone.text,
  //             isNewUser: false,
  //             //false means user data will be there in firestore,fetch data
  //             //from there and saved to sharedpref to use locally.
  //           ),
  //           //send true to otpscreen
  //         ),
  //       );
  //     } else {
  //       //if user is not registered
  //       Navigator.pop(context);
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (c) => OTPScreen(
  //             phonenumber: phone.text,
  //             isNewUser: true,
  //             //true means user data not there so take data from user in other screen
  //             //and save to firestore and shredpref store data locally.
  //           ),
  //           //send false to otpscreen.
  //         ),
  //       );
  //     }
  //   });
  // }

  // if (phone.text) {
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
        //  Padding(
        //   padding: EdgeInsets.symmetric(
        //       horizontal: MediaQuery.of(context).size.width * 0.13),
        //   child: Form(
        //     child: Column(
        //       children: [
        //         const Spacer(),
        //         Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: CustomTextField(
        //             //maxlength: 10,
        //             icocolor: Colors.white,
        //             hintTextcolor: Colors.white,
        //             lalebText: "Mobile Number",
        //             controller: phone,
        //             hintText: "",
        //             icon: Icons.person,
        //             textInputType: TextInputType.number,
        //           ),
        //         ),
        //         const SocalButtns(),
        //         Container(
        //           decoration: BoxDecoration(
        //             color: const Color.fromARGB(255, 80, 204, 55),
        //             borderRadius: BorderRadius.circular(20.0),
        //           ),
        //           width: double.infinity,
        //           child: TextButton(
        //             onPressed: () {
        //               validateForm();
        //             },
        //             //   //TODOS: check is otp correct or wrong, if correct send to dashboard
        //             //   //TODOS: OTHERWISE POPUP WRONG OTP.
        //             // },
        //             child: const Text(
        //               "Continue",
        //               style: TextStyle(
        //                 color: Colors.white,
        //               ),
        //             ),
        //           ),
        //         ),
        //         const Spacer(flex: 2),
        //         // const SocalButtns(),
        //       ],
        //     ),
        //   ),
        // ),
        );
  }
}






  // }
  //   if () {
  //     // ignore: avoid_print
  //     print((firstname.text + secondname.text));
  //     sharedPreferences!
  //         .setString("name", (firstname.text + secondname.text));
  //     // ignore: avoid_print
  //     print(sharedPreferences!.getString("name"));
  //     // ignore: avoid_print
  //     print("Going to Otp screen");
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => OTPScreen(
      //               phonenumber: phone.text.toString(),
      //               userName: (firstname.text + secondname.text).toString(),
      //             )));
  //   } else {
  //     // Navigator.pop(context);
  //     return showDialog(
  //       context: context,
  //       builder: (e) {
  //         return const ErrorDialog(message: "Email or phone is incorrect");
  //       },
  //     );
  //   }
  // }







// Padding(
//                 padding: const EdgeInsets.symmetric(vertical: defpaultPadding),
//                 child: CustomTextField(
//                   controller: secondname,
//                   hintText: "Last Name",
//                   icon: Icons.person,
//                   textInputType: TextInputType.name,
//                 ),
//               ),
//               CustomTextField(
//                 controller: emailname,
//                 hintText: "Email id",
//                 icon: Icons.email,
//                 textInputType: TextInputType.emailAddress,
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: defpaultPadding),
//                 child: CustomTextField(
//                   controller: phone,
//                   hintText: "Phone Number",
//                   icon: Icons.phone,
//                   textInputType: TextInputType.phone,
//                 ),
//               ),





























//legacy
// import 'package:flutter/material.dart';

// import '../../../constant.dart';

// class LoginForm extends StatefulWidget {
//   final TextEditingController phoneController;
//   final TextEditingController passwordController;
//   const LoginForm({
//     Key? key,
//     required this.phoneController,
//     required this.passwordController,
//   }) : super(key: key);

//   @override
//   State<LoginForm> createState() => _LoginFormState();
// }

// class _LoginFormState extends State<LoginForm> {
//   late bool _passwordvisible;
//   @override
//   void initState() {
//     _passwordvisible = false;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return
// Padding(
//       padding: EdgeInsets.symmetric(
//           horizontal: MediaQuery.of(context).size.width * 0.13),
//       child: Form(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Spacer(),
//             TextFormField(
//               controller: widget.phoneController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                 prefixIcon: const Icon(
//                   Icons.phone,
//                   color: Colors.white,
//                 ),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(18),
//                   borderSide: const BorderSide(
//                     width: 0,
//                     style: BorderStyle.none,
//                   ),
//                 ),
//                 hintText: "Phone",
//                 hintStyle: const TextStyle(
//                   color: Colors.white,
//                   fontFamily: "VarelaRound",
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: defpaultPadding),
//               child: TextFormField(
//                 controller: widget.passwordController,
//                 keyboardType: TextInputType.name,
//                 obscureText: !_passwordvisible,
//                 decoration: InputDecoration(
//                   suffixIcon: IconButton(
//                     onPressed: () {
//                       setState(() {
//                         _passwordvisible = !_passwordvisible;
//                       });
//                     },
//                     icon: Icon(
//                       !_passwordvisible
//                           ? Icons.visibility_off
//                           : Icons.visibility,
//                       color: Colors.white,
//                     ),
//                   ),
//                   prefixIcon: const Icon(
//                     Icons.lock,
//                     color: Colors.white,
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(18),
//                     borderSide: const BorderSide(
//                       width: 0,
//                       style: BorderStyle.none,
//                     ),
//                   ),
//                   hintText: "Password",
//                   hintStyle: const TextStyle(
//                     color: Colors.white,
//                     fontFamily: "VarelaRound",
//                   ),
//                 ),
//               ),
//             ),
//             TextButton(
//               onPressed: () {},
//               child: const Text(
//                 "Forgot Password?",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontFamily: "VarelaRound",
//                 ),
//               ),
//             ),
//             const Spacer(flex: 2),
//           ],
//         ),
//       ),
//     );
//   }
// }