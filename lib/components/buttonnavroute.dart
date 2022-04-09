import 'package:flutter/material.dart';

class ButtomNavRoute extends StatefulWidget {
  const ButtomNavRoute({Key? key}) : super(key: key);

  @override
  State<ButtomNavRoute> createState() => _ButtomNavRouteState();
}

class _ButtomNavRouteState extends State<ButtomNavRoute> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      
      child: Container(color: Colors.red,height: 200,),
    );
  }
}