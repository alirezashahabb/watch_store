import 'package:clock_shop/route/name.dart';
import 'package:clock_shop/screens/auth/sens_sms_screen.dart';
import 'package:clock_shop/screens/register_otp_screen.dart';
import 'package:clock_shop/screens/root_screen.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  ScreenNames.root: (context) => const SendSmsScreen(),
  ScreenNames.registerScreen: (context) => const RegisterOtp(),
  ScreenNames.rootScreen: (context) => const RootScreen(),
};
