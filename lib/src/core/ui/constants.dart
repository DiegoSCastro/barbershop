import 'package:flutter/material.dart';

sealed class AppFonts {
  static const String poppins = 'Poppins';
}

sealed class AppAssets {
  static const String backgroundChair = 'assets/images/background_image_chair.jpg';
  static const String logo = 'assets/images/imgLogo.png';
  static const String avatar = 'assets/images/avatar.png';
}

sealed class AppColors {
  static const Color brown = Color(0xFFB07B01);
  static const Color greyLightest = Color(0xFFE6E2E9);
  static const Color greyLight = Color(0xFFBDBDBD);
  static const Color grey = Color(0xFF999999);
  static const Color red = Color(0xFFEB1212);
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
}
