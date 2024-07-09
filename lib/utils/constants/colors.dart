import 'package:flutter/material.dart';

class TColors{


  TColors._();

  static const Color primaryColor = Color(0xFF4B68FF);
  static const Color secondary = Color(0xffffe24b);
  static const Color accent = Color(0xffb0c7ff);
  static const Color white = Colors.white;

  static const Color textPrimary = Color(0xff333333);
  static const Color textSecondary = Color(0xff6c757d);
  static const Color textWhite = Colors.white;

  static const Color light = Color(0xfff6f6f6);
  static const Color dark = Color(0xff272727);
  static const Color primaryBackground = Color(0xfff3f5ff);

  static const Color lightContainer = Color(0xfff6f6f6);

  static  Color darkContainer = TColors.white.withOpacity(0.1);

  static const Color buttonPrimary = Color(0xff4b68ff);
  static const Color buttonSecondary = Color(0xff6c7570);
  static const Color buttonDisabled = Color(0xffc4c4c4);

  static const Color borderPrimary = Color(0xffc4c4c4);
  static const Color borderSecondary = Color(0xffe6e6e6);

  static const Color error = Color(0xffd32f2f);
  static const  Color success = Color(0xff388e3c);
  static const Color warning = Color(0xfff57c00);
  static const Color info = Color(0xff1976d2);


  //gradient colors

  static const Gradient linearGradient = LinearGradient(
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.707, -0.707),
    colors: [
      Color(0xffff9a9e),
      Color(0xfffad0c4),
      Color(0xfffad0c4),
    ],
  );






}