import 'package:clock_shop/route/name.dart';
import 'package:clock_shop/screens/get_otp_screen.dart';
import 'package:clock_shop/screens/register_otp_screen.dart';
import 'package:clock_shop/screens/root_screen.dart';
import 'package:clock_shop/screens/send_otp_screen.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  ScreenNames.root: (context) => const RootScreen(),
  ScreenNames.getOtpScreen: (context) => const GetOtpScreen(),
  ScreenNames.registerScreen: (context) => const RegisterOtp(),
  ScreenNames.sendOtpScreen: (context) => const SendOtpScreen(),
};
