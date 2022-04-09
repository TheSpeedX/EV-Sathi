import 'package:ev_station/global.dart';
import 'package:ev_station/screen/mappage.dart';
import 'package:flutter/material.dart';
import '../sidebar/drawer.dart';
import '../sidebar/components/top_header.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({
    Key? key,
  }) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  //bool? s = sharedPreferences!.getBool("isNewUser");

//TODOS: 1

  // requestPermission() async {
  //   await [
  //     Permission.location,
  //   ].request();
  //TODOS: handle permission related queriesif user denied.
  //}

  //TODOS: 1 end

  Future<void> getTokenId() async {
    await firebaseAuth.currentUser!.getIdToken().then((value) {
      //print(value);
      sharedPreferences!.setString("getTokenId", value);
      // print(sharedPreferences!.getString("getTokenId").toString());
      //  setState(() {});
    });
  }

  // showMyDialog() {
  //   return showDialog(
  //     context: context,
  //     builder: (context) {
  //       return const myTextField();
  //     },
  //   );
  // }

  @override
  void initState() {
    super.initState();
    getTokenId();
    //TODOS: 2 start
    // requestPermission();
    //TODOS: 2 end
    // s == true ? createPopUpDialog(context) : null;
  }

  TextEditingController namecontroller = TextEditingController();

  // createPopUpDialog(BuildContext context) {
  //   return showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           title: const Text("Your name"),
  //           content: TextField(
  //             controller: namecontroller,
  //           ),
  //           actions: [
  //             MaterialButton(
  //               onPressed: () async {
  //                 Navigator.pop(context);
  //                 await sharedPreferences!.setBool("isNewUser", false);
  // setState(() {});
  //               },
  //               elevation: 5.0,
  //               child: const Text("Submit"),
  //             ),
  //           ],
  //         );
  //       });
  // }

  // ignore: unused_field
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
    //print(s);
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      body: Stack(
        children:  [
          //TopHeader(),
          // MapPage(),
          Positioned.fill(
            child: MapPage(),
          ),
          TopHeader(),
        ],
      ),

    );
  }
}
