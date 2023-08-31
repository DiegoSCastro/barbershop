import 'package:flutter/material.dart';

import 'constants.dart';

sealed class BarbershopTheme {
  static ThemeData themeData = ThemeData(
    useMaterial3: true,
    fontFamily: AppFonts.poppins,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.white,
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
        fontFamily: AppFonts.poppins,
      ),
      iconTheme: IconThemeData(
        color: AppColors.brown,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.white,
      labelStyle: const TextStyle(color: AppColors.grey),
      border: _defaultInputBorder,
      enabledBorder: _defaultInputBorder,
      focusedBorder: _defaultInputBorder,
      errorBorder: _defaultInputBorder.copyWith(
        borderSide: const BorderSide(color: AppColors.red),
      ),
      focusedErrorBorder: _defaultInputBorder.copyWith(
        borderSide: const BorderSide(color: AppColors.red),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.brown,
        side: const BorderSide(
          color: AppColors.brown,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.brown,
        foregroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  );

  static const _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(8),
    ),
    borderSide: BorderSide(color: AppColors.grey),
  );
}
