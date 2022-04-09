import 'package:flutter/material.dart';

import '../../../components/errordialog.dart';

class BuildPricingCalBody extends StatefulWidget {
  //final String phoneNumber;
  const BuildPricingCalBody({
    Key? key,
    // required this.phoneNumber,
  }) : super(key: key);

  @override
  State<BuildPricingCalBody> createState() => _BuildPricingCalBodyState();
}

class _BuildPricingCalBodyState extends State<BuildPricingCalBody> {
  List<String> vechDetails = [
    "2w (Two-Wheeler)",
    "3w (Three-Wheeler)",
    "4w (Four-Wheeler)",
    "Bus",
  ];
  List<String> public = [
    "12 kWH",
    "25 kWH",
    "35 kWH",
  ];

  String? vehdet;
  String? publicdet;
  String? textBattery;
  String? rangeBattery;
  double? batteryCap;
  double? publicCap;
  String? timeTaken = " Time * : Click on Calculate to show time.";
  String? costToUser = "Cost * : Click on Calculate to show cost.";
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
                const SizedBox(
                  height: 20.0,
                ),
                DropdownButtonFormField(
                  hint: const Text("Vehicle Segment *"),
                  value: vehdet,
                  items: vechDetails.map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    );
                  }).toList(),
                  onChanged: (val) {
                    publicdet = null;
                    timeTaken = " Time * : Click on Calculate to show time.";
                    //vehdet = null;
                    if (val == "2w (Two-Wheeler)") {
                      setState(() {
                        textBattery = "Battery Capacity * : 3 kWH";
                        batteryCap = 3.0;
                        publicCap = 95.0;
                        rangeBattery = "Range * : 95 km";
                      });
                    }
                    if (val == "3w (Three-Wheeler)") {
                      setState(() {
                        textBattery = "Battery Capacity * : 7.4 kWH";
                        batteryCap = 7.4;
                        publicCap = 91.0;
                        rangeBattery = "Range * : 91 km";
                      });
                    }
                    if (val == "Battery Capacity * : 4w (Four-Wheeler)") {
                      setState(() {
                        textBattery = "40 kWH";
                        batteryCap = 40.0;
                        publicCap = 250.0;
                        rangeBattery = "Range * : 250 km";
                      });
                    }
                    if (val == "Bus") {
                      setState(() {
                        textBattery = "Battery Capacity * : 320 kWH";
                        batteryCap = 320.0;
                        publicCap = 250.0;
                        rangeBattery = "Range * : 250 km";
                      });
                    }
                    setState(() {
                      vehdet = val.toString();
                    });
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: textBattery,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: rangeBattery,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                DropdownButtonFormField(
                  hint: const Text("Public Charger *"),
                  value: publicdet,
                  items: public.map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    );
                  }).toList(),
                  onChanged: (val) {
                    timeTaken = " Time * : Click on Calculate to show time.";
                    costToUser = " Cost * : Click on Calculate to cost.";
                    setState(() {
                      publicdet = val.toString();
                      if (publicdet == "12 kWH") {
                        setState(() {
                          publicCap = 12;
                        });
                      }
                      if (publicdet == "25 kWH") {
                        setState(() {
                          publicCap = 25;
                        });
                      }
                      if (publicdet == "35 kWH") {
                        setState(() {
                          publicCap = 35;
                        });
                      }
                    });
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: " Cost per kWH * : Rs. 6.5 ",
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: timeTaken,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: costToUser,
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    //TODOS: CALCULATE AND SHOW
                    if (vehdet != null && publicdet != null) {
                      // print(batteryCap);
                      // print(publicCap);
                      // print((batteryCap! / publicCap!) * 60);
                      print(batteryCap);
                      double cost = batteryCap! * 6.5;
                      double time = (batteryCap! / publicCap!) * 60;
                      setState(() {
                        timeTaken = "Time * : " +
                            time.toString().substring(0, 4) +
                            " min";
                        costToUser = "Cost * : Rs " + cost.toString();
                        // print(timeTaken);
                      });
                      //timeTaken =
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const ErrorDialog(
                              message: "Please select all",
                            );
                          });
                    }
                  },
                  child: SizedBox(
                    height: size.height * 0.06,
                    width: double.infinity,
                    child: const Center(
                      child: Text(
                        "Calculate",
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
}
