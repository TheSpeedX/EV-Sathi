import 'dart:async';
import 'package:ev_station/components/loading_dialog.dart';
import 'package:ev_station/screen/profile_screen/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../../../global.dart';

class BuildBodyNewUser extends StatefulWidget {
  final String phoneNumber;
  const BuildBodyNewUser({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  State<BuildBodyNewUser> createState() => _BuildBodyNewUserState();
}