import 'package:ev_sathi/screen/vehicle_add/vech.dart';
import 'package:flutter/material.dart';

class VechScreenAdditionDisplay extends StatelessWidget {
  final String number;
  const VechScreenAdditionDisplay({
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
                  Image.asset("assets/images/vechile.png"),
                  const Text(
                    "Help us serve you better",
                    style: TextStyle(
                        fontSize: 24.0,
                        fontFamily: "VarelaRound",
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 40.0,
                      right: 40.0,
                    ),
                    child: Center(
                      child: Text(
                        "Share your vehicle details and location prefrences for customised services and offers",
                        style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: "VarelaRound",
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.35,
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
                        builder: (context) =>  Vehical(number: number),
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
