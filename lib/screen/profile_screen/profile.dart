import 'package:flutter/material.dart';

import 'package:ev_station/screen/profile_screen/profile_header.dart';
import 'package:ev_station/screen/profile_screen/profilebody.dart';

class Profile extends StatelessWidget {
  final String phoneNumber;
  const Profile({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const ProfileHeader(),
          BuildProfileBody(phoneNumber: phoneNumber),
        ],
      ),
    );
  }
}
