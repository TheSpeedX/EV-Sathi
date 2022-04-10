import 'package:flutter/material.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeigh;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeigh = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}
  double getPropotionateScreenHeight(double inputHeight) {
    double screenHeight = SizeConfig.screenHeigh;
    return (inputHeight / 812.0) * screenHeight;
  }
  double getPropotionateScreenWidth(double inputWidth) {
    double screenWidth = SizeConfig.screenWidth;
    return (inputWidth / 812.0) * screenWidth;
  }