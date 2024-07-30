import 'package:flutter/material.dart';
import 'package:watch_store/res/dimends.dart';

class AppButtonStyles {
  AppButtonStyles._();

  static ButtonStyle mainButtonStyle = ButtonStyle(
      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimes.medium))));
}
