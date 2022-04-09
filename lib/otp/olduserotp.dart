import 'package:flutter/material.dart';
import 'package:ev_station/otp/components/buildbodyotp.dart';
import 'components/headerOtp.dart';

class OldUserOTPScreen extends StatefulWidget {
  final String phone;
  const OldUserOTPScreen({
    Key? key,
    required this.phone,
  }) : super(key: key);