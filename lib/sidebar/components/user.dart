import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  final String urlImage;
  final String name;
  const UserPage({
    Key? key,
    required this.urlImage,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(name),
    );
  }
}
