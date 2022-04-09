import 'package:ev_sathi/sidebar/components/pric_components/price_cal_body.dart';
import 'package:ev_sathi/sidebar/components/pric_components/pricing_header.dart';
import 'package:flutter/material.dart';

class PricingCal extends StatelessWidget {
  //final String phoneNumber;
  const PricingCal({
    Key? key,
    //required this.phoneNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: const [
          PricingCalHeader(),
          BuildPricingCalBody(),
        ],
      ),
    );
  }
}
