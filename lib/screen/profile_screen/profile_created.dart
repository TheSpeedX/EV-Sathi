import 'package:flutter/material.dart';

import 'package:ev_station/screen/vehicle_add/vech_add_display.dart';

class ProfileCreated extends StatelessWidget {
  final String number;
  const ProfileCreated({
    Key? key,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.2,
            ),
            Center(
              child: Column(
                children: [
                  Image.asset("assets/images/otp.png"),
                  const Text(
                    "Success",
                    style: TextStyle(
                        fontSize: 24.0,
                        fontFamily: "VarelaRound",
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Your account is sucessfully created",
                    style: TextStyle(
                      fontSize: 15.0,
                      fontFamily: "VarelaRound",
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.4,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 40.0,
                right: 40.0,
              ),
              child: SizedBox(
                height: 45,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        //TODOS: SEND TO ADD VEHICLE SECTION and then to Dashboard..
                        //TODOS: Hurrah!
                        builder: (context) =>
                            VechScreenAdditionDisplay(number: number),
                        // DashBoard(),
                      ),
                      (route) => false,
                    );
                  },
                  child: const Text("Ok"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
