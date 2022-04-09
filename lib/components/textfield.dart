import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
 // final int maxlength;
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final Color icocolor;
  final Color hintTextcolor;
  final String lalebText;
  final TextInputType textInputType;
  const CustomTextField({
    Key? key,
    required this.controller,
   // required this.maxlength,
    required this.hintText,
    required this.icon,
    required this.icocolor,
    required this.hintTextcolor,
    required this.lalebText,
    required this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: TextFormField(
       // maxLength: maxlength,
        controller: controller,
        enabled: true,
        keyboardType: TextInputType.name,
        obscureText: false,
        autofocus: true,
        style: const TextStyle(color: Color.fromARGB(255, 191, 221, 59)),
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(25.0),
          labelText: lalebText,
          labelStyle: const TextStyle(color: Colors.white),
          //border: const OutlineInputBorder()
          //   borderSide: BorderSide(
          //     color: Colors.black,

          //   ),
          //   borderRadius: BorderRadius.all(
          //     Radius.circular(5.0),
          //   ),
          // ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 2.0),
            borderRadius: BorderRadius.circular(25.0),
          ),
          fillColor: Colors.white,
          prefixIcon: Icon(
            icon,
            color: icocolor,
          ),
          // focusColor: Theme.of(context).primaryColor,
          hintText: hintText,
          hintStyle: TextStyle(color: hintTextcolor),
        ),
      ),
    );
  }
}
