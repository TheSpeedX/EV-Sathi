import 'dart:math';

import 'package:flutter/material.dart';

class DesignConnectors extends StatefulWidget {
  const DesignConnectors({Key? key}) : super(key: key);

  @override
  State<DesignConnectors> createState() => _DesignConnectorsState();
}

class _DesignConnectorsState extends State<DesignConnectors> {
  // List number = [6.0,6.1,6.2];
  double doubleInRange(num start, num end) {
    return Random().nextDouble() * (end - start) + start;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Column(
        children: [
          SizedBox(
            //height: 180,
            width: 170,
            child: Column(
              children: [
                Container(
                  height: 40,
                  width: double.infinity,
                  //color: Colors.green,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12.0),
                        topLeft: Radius.circular(12.0)),
                  ),
                  child: const Center(
                    child: Text(
                      "Charger A",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: PhysicalModel(
                    color: Colors.white,
                    elevation: 8,
                    shadowColor: Colors.blue,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0),
                    ),
                    child: SizedBox(
                      width: 170,
                      height: 180,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 30.0,
                          ),
                          const Icon(
                            Icons.battery_charging_full_rounded,
                            color: Colors.blue,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          const Text("CCS -2"),
                          const SizedBox(
                            height: 10.0,
                          ),
                          //6-7.5
                          // int guessNumber = (int)(Math.random()*(range2-range1+1)+range1);

                          Text(
                            "Cost per Kwh: ₹ " +
                                doubleInRange(6.00, 7.50)
                                    .toString()
                                    .substring(0, 4),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          const Divider(
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "View Tariff",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w700,
                                fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Container(
                //   height: 110,
                //   decoration: const BoxDecoration(
                //     color: Colors.pink,
                // borderRadius: BorderRadius.only(
                //     bottomLeft: Radius.circular(12.0),
                //     bottomRight: Radius.circular(12.0)),
                // ),
                // ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
