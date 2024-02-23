import 'package:fast_buy/constants.dart';
import 'package:flutter/material.dart';

abstract class Styles {
  static TextStyle styleRegular16 = TextStyle(
    fontSize: width < 380 ? 12 : 16,
    fontWeight: FontWeight.w400,
  );
  static TextStyle styleMedium16 = TextStyle(
    fontSize: width < 380 ? 12 : 16,
    fontWeight: FontWeight.w500,
  );
  static TextStyle styleSemiBold32 = TextStyle(
    fontSize: width < 380 ? 26 : 32,
    fontWeight: FontWeight.w600,
  );
}
