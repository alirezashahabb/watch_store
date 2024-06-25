import 'package:clock_shop/res/color.dart';
import 'package:clock_shop/res/dimends.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme() {
  return ThemeData(
    useMaterial3: false,
    brightness: Brightness.light,
    iconTheme: const IconThemeData(color: Colors.black),
    primaryColor: AppColors.primaryColor,
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(AppColors.primaryColor),
      ),
    ),
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: MaterialStateColor.resolveWith(
        (states) {
          if (states.contains(MaterialState.focused)) {
            return AppColors.focusedTextField;
          } else {
            return AppColors.unFocusedTextField;
          }
        },
      ),
      contentPadding: const EdgeInsets.all(AppDimes.medium),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimes.medium),
        borderSide: const BorderSide(color: AppColors.borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimes.medium),
        borderSide: const BorderSide(color: AppColors.primaryColor),
      ),
    ),
  );
}
