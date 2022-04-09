// ignore: import_of_legacy_library_into_null_safe
import 'package:curved_splash_screen/curved_splash_screen.dart';
import 'package:ev_station/Screen/Splash/components/splash_content.dart';
import 'package:ev_station/constant.dart';
import 'package:ev_station/screen/auth/sign_in/login_form.dart';
import 'package:flutter/material.dart';

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
        backText: backtText,
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
//        SafeArea(
//         child: SizedBox(
//           width: double.infinity,
//           child: Column(
//             children: [
//               Expanded(
//                 flex: 3,
//                 child: PageView.builder(
//                   onPageChanged: ((value) {
//                     setState(() {
//                       currentPage = value;
//                     });
//                   }),
//                   itemCount: splashData.length,
//                   itemBuilder: ((context, index) =>
    //  SplashContent(
    //           image: splashData[index]["image"].toString(),
    //           text: splashData[index]["text"].toString(),
    //           color: color[index],
    //         ),
//                    ),
//                 ),
//               ),
//               Expanded(
//                 child: Container(
//                   decoration: const BoxDecoration(
//                     color: Color(0xFF53AEE1),
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(100.0),
//                       //bottomLeft: Radius.circular(90.0),
//                       // bottomRight: Radius.circular(500.0),
//                       topRight: Radius.circular(90.0),
//                     ),
//                   ),
//                   child: Column(
//                     children: [
//                       const SizedBox(
//                         height: 5.0,
//                       ),
//                       Row(
//                         mainAxisSize: MainAxisSize.min,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: List.generate(
//                           splashData.length,
//                           (index) => buildDot(index),
//                         ),
//                       ),
//                       const Spacer(flex: 8),
//                       currentPage == 2
//                           ? Button(
//                               text: "Sign In",
//                               onPressed: () {
//                                 Navigator.pushNamed(
//                                     context, SignInScreen.routeName);
//                               },
//                             )
//                           : Container(),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   AnimatedContainer buildDot(int index) {
//     return AnimatedContainer(
//       duration: animationDuration,
//       margin: const EdgeInsets.only(right: 5),
//       height: 9.0,
//       width: currentPage == index ? 40 : 20,
//       decoration: BoxDecoration(
//         color: currentPage == index
//             ? const Color(0xFF88E296)
//             : const Color(0xFF62D3D2),
//         borderRadius: BorderRadius.circular(3),
//       ),
//     );
//   }
// }
  }
}
