import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../components/errordialog.dart';
import '../../components/loading_dialog.dart';
import '../../global.dart';
import '../dashboard.dart';

class VechileBody extends StatefulWidget {
  final String phoneNumber;
  const VechileBody({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  State<VechileBody> createState() => _VechileBodyState();
}

class _VechileBodyState extends State<VechileBody> {
  TextEditingController vrn = TextEditingController();
  TextEditingController vin = TextEditingController();
  List<String> make = [
    "Tata Motors",
    "Mahindra",
    "Hyundai",
    "MG Motors",
    "Jaguar",
  ];
  List<String> tataEv = ["E-Tigor", "Nexon Ev", "Tiger Ev Ziptron"];
  List<String> mahindraEv = ["E-Verito", "e20 plus 8"];
  List<String> hyundaiEv = ["Kona"];
  List<String> mgmotorEv = ["ZS Ev"];
  List<String> jagourEv = ["I-Pace"];
  String? maker;
  String? model;
  List<String> models = [];

  // String? makeId;

  @override
  void initState() {
    super.initState();
  }

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
                  hint: const Text("Maker *"),
                  value: maker,
                  items: make.map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    );
                  }).toList(),
                  onChanged: (val) {
                    model = null;
                    if (val == "Tata Motors") {
                      models = tataEv;
                    }
                    if (val == "Mahindra") {
                      models = mahindraEv;
                    }
                    if (val == "Hyundai") {
                      models = tataEv;
                    }
                    if (val == "MG Motors") {
                      models = mgmotorEv;
                    }
                    if (val == "Jaguar") {
                      models = jagourEv;
                    }
                    setState(() {
                      maker = val.toString();
                    });
                  },
                ),
                const SizedBox(
                  height: 30.0,
                ),
                //models
                DropdownButtonFormField(
                  hint: const Text("Model *"),
                  value: model,
                  items: models.map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    );
                  }).toList(),
                  onChanged: (val) {
                    setState(() {
                      model = val.toString();
                    });
                  },
                ),

                const SizedBox(
                  height: 30.0,
                ),

                TextFormField(
                  controller: vrn,
                  keyboardType: TextInputType.name,
                  cursorHeight: 20,
                  decoration: InputDecoration(
                    labelText: "Vehicle Registration Number",
                    labelStyle: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                TextFormField(
                  controller: vin,
                  keyboardType: TextInputType.name,
                  cursorHeight: 20,
                  decoration: InputDecoration(
                    labelText: "VIN",
                    labelStyle: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    validateForm();
                    // validateForm(context);
                  },
                  child: SizedBox(
                    height: size.height * 0.06,
                    width: double.infinity,
                    child: const Center(
                      child: Text(
                        "Add",
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

  void validateForm() async {
    if (vrn.text.isNotEmpty &&
        vin.text.isNotEmpty &&
        maker!.isNotEmpty &&
        model!.isNotEmpty) {
      showDialog(
          context: context,
          builder: (context) {
            return const LoadingDialog(
              message: "",
            );
          });
      await saveDataToFirebaseAndLocally();
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return const ErrorDialog(
              message: "Please select all",
            );
          });
    }
  }

  saveDataToFirebaseAndLocally() async {
    await FirebaseFirestore.instance
        .collection("phone")
        .doc(widget.phoneNumber)
        .set(
          ({
            "userVechMaker": maker,
            "userVechModel": model,
            "userVechRegNum": vrn.text.trim().toString(),
            "userVIN": vin.text.trim().toString(),
            "userEmail": sharedPreferences!.getString("email"),
            "fullName": sharedPreferences!.getString("name"),
            "phoneNumber": widget.phoneNumber.trim(),
            "pincode": sharedPreferences!.getString("pincode"),
          }),
        );
    // SharedPreferences? sharedPreferences =
    //     await SharedPreferences.getInstance();
    await sharedPreferences!.setString("userVechMaker", maker.toString());
    await sharedPreferences!.setString("userVechModel", model.toString());
    await sharedPreferences!.setString("userVechRegNum", vrn.toString());
    await sharedPreferences!.setString("userVIN", vin.toString());
    Navigator.pop(context);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const DashBoard(),
      ),
      (route) => false,
    );
    showSnackBar(context, "LoggedIn Sucessfully");
  }
}
