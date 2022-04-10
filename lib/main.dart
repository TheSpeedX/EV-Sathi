import 'package:ev_sathi/routes.dart';
import 'package:ev_sathi/screen/Splash/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import 'global.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: ((context, orientation, deviceType) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Ev Sathi",
            initialRoute: SplashScreen.routeName,
            routes: routes,
            theme: ThemeData().copyWith(
              // change the focus border color of the TextField
              colorScheme:
                  ThemeData().colorScheme.copyWith(primary: Colors.amber),
              // change the focus border color when the errorText is set
              errorColor: Colors.purple,
            ),
            // theme: ThemeData(
            //   primarySwatch: Colors.blue,
              // inputDecorationTheme: const InputDecorationTheme(
              //   filled: true,
              //   fillColor: Colors.white38,
              //   border: InputBorder.none,
              //   hintStyle: TextStyle(
              //     color: Colors.white,
              //   ),
              //   contentPadding: EdgeInsets.symmetric(
              //     vertical: defpaultPadding * 1.2,
              //     horizontal: defpaultPadding,
              //   ),
              // ),
            // ),
            // home:  Home(),
          )),
    );
  }
}
