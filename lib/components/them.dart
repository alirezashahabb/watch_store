import 'package:flutter/material.dart';
import 'package:watch_store/res/color.dart';
import 'package:watch_store/res/dimends.dart';

ThemeData lightTheme() {
  return ThemeData(
    useMaterial3: false,
    brightness: Brightness.light,
    iconTheme: const IconThemeData(color: Colors.black),
    primaryColor: AppColors.primaryColor,
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(AppColors.primaryColor),
      ),
    ),
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: WidgetStateColor.resolveWith(
        (states) {
          if (states.contains(WidgetState.focused)) {
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
