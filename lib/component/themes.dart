import 'package:flutter/material.dart';
import 'package:watch_store/res/colors.dart';
import 'package:watch_store/res/dimens.dart';

ThemeData lightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    iconTheme: const IconThemeData(color: Colors.black),
    primaryColor: AppColors.primaryColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor:
                const WidgetStatePropertyAll(AppColors.primaryColor))),
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.focused)) {
          return AppColors.focusedTextField;
        } else if (states.contains(WidgetState.error)) {
          return AppColors.error;
        } else {
          return AppColors.unFocusedTextField;
        }
      }),
      contentPadding: const EdgeInsets.all(AppDimens.medium),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimens.medium),
        borderSide: const BorderSide(color: AppColors.borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimens.medium),
        borderSide: const BorderSide(color: AppColors.primaryColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppDimens.medium),
        borderSide: const BorderSide(
          color: AppColors.error,
        ),
      ),
    ),
  );
}
