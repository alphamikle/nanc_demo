import 'package:flutter/material.dart';

const double height = 215;
const String mainFont = 'DM Sans';

abstract final class ColorsData {
  static const Color primary = Color(0xFF0B59D5);
  static const Color primaryDarken = Color(0xFF0A50C0);
  static const Color primaryDarkest = Color(0xFF0948AD);

  static const Color secondary = Color(0xFFFFFFFF);
  static const Color secondaryDarken = Color(0xFFCDDEF7);
  static const Color secondaryAccent = Color(0xFFE9F2F9);
  static const Color tertiary = Color(0xFFFCB61A);
  static const Color quaternary = Color(0xFF999999);
  static const Color quaternaryDarken = Color(0xFF696E70);
  static const Color quaternaryLighten = Color(0xFFEEEEEE);

  static const Color textBasic = Color(0xFF000000);
  static const Color textLight = Color(0xFFDCDCDC);
}

abstract final class Gap {
  static const double x1 = 4;
  static const double x2 = 8;
  static const double x3 = 16;
  static const double x4 = 24;
  static const double x5 = 32;
  static const double x6 = 48;
}
