import 'package:flutter/material.dart';

class CardNearestEv extends StatefulWidget {
  const CardNearestEv({Key? key}) : super(key: key);

  @override
  State<CardNearestEv> createState() => _CardNearestEvState();
}

class _CardNearestEvState extends State<CardNearestEv> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
        child: Container(
            height: 200,
            width: size.width - 20,
            decoration: BoxDecoration(
              color: const Color(0xFFF9F8FF),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 2.0,
                  color: isSelected ? Colors.transparent : Colors.red,
                  //blurRadius: 25.0,
                  spreadRadius: 1.0,
                  // offset: Offset(2.0, 2.0), // shadow direction: bottom right
                )
              ],
            ),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //1.
                Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SizedBox(height: 5,),
                      const Text(
                        "Sourav Bera Station",
                        style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Icon(
                            Icons.timer,
                            color: Color.fromARGB(255, 134, 139, 218),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text("30 min"),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Icon(
                            Icons.telegram,
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text("325 km"),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text("Sathi : Best"),
                    ],
                  ),
                ),
                //2.
                CircleAvatar(
                  radius: 50.0,
                  backgroundColor: Colors.transparent,
                  child: Image.asset(
                    "assets/images/mk.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
