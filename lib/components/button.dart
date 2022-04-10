import 'package:ev_sathi/size_config.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const Button({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getPropotionateScreenHeight(56),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
              fontSize: getPropotionateScreenWidth(50.0),
              fontFamily: "Signatra",
              color: Colors.white,
              
            ),
          ),
          style: TextButton.styleFrom(
              backgroundColor: const Color(0xFF62D974),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              )),
        ),
      ),
    );
  }
}
