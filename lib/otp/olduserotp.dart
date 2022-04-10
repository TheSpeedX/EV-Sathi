import 'package:flutter/material.dart';
import 'components/buildbodyotp.dart';
import 'components/headerOtp.dart';

class OldUserOTPScreen extends StatefulWidget {
  final String phone;
  const OldUserOTPScreen({
    Key? key,
    required this.phone,
  }) : super(key: key);

  @override
  State<OldUserOTPScreen> createState() => _OldUserOTPScreenState();
}

class _OldUserOTPScreenState extends State<OldUserOTPScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const HeaderOTPScreenOld(),
          BuildBodyOTPScreen(
            phoneNumber: widget.phone,
          ),
          // BuildBodyOTP(),
        ],
      ),
    );
  }
}
