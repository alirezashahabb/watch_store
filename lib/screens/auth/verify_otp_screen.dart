import 'dart:async';

import 'package:cherry_toast/cherry_toast.dart';
import 'package:clock_shop/components/text_style.dart';
import 'package:clock_shop/gen/assets.gen.dart';
import 'package:clock_shop/res/dimends.dart';
import 'package:clock_shop/res/extions.dart';
import 'package:clock_shop/res/string.dart';
import 'package:clock_shop/screens/auth/cubit/auth_cubit.dart';
import 'package:clock_shop/screens/register_otp_screen.dart';
import 'package:clock_shop/screens/root_screen.dart';
import 'package:clock_shop/widget/app_text_feild.dart';
import 'package:clock_shop/widget/main_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyOtpScreen extends StatefulWidget {
  final String number;
  const VerifyOtpScreen({super.key, required this.number});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    statrTime();
  }

  late Timer maintimer;
  int start = 120;

  statrTime() {
    const onesec = Duration(seconds: 1);
    maintimer = Timer.periodic(
      onesec,
      (timer) {
        setState(
          () {
            if (start == 0) {
              maintimer.cancel();
              CherryToast.error(
                title: const Text("مدت زمان وارد کردن کد پبامکی منقضی شده هست ",
                    style: AppTextStyles.title),
              ).show(context);
              Future.delayed(const Duration(seconds: 5)).then((value) {
                Navigator.of(context).pop();
              });
            } else {
              start--;
            }
          },
        );
      },
    );
  }

  String formatTimer(int sec) {
    int minuet = sec ~/ 60;
    int second = sec % 60;
    String minStart = minuet.toString().padLeft(2, '0');
    String secondStart = second.toString().padLeft(2, '0');

    return '$minStart:$secondStart';
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(AppDimes.medium),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Assets.png.mainLogo.image(),
              AppDimes.medium.hight,
              Text(
                AppStrings.otpCodeSendFor
                    .replaceAll(AppStrings.replace, widget.number),
                style: AppTextStyles.title,
              ),
              AppDimes.medium.hight,
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  AppStrings.wrongNumberEditNumber,
                  style: AppTextStyles.primaryThemeTextStyle,
                ),
              ),
              AppDimes.large.hight,
              MyAppTextFelid(
                label: AppStrings.enterVerificationCode,
                hint: AppStrings.hintVerificationCode,
                caption: formatTimer(start),
                controller: controller,
                type: TextInputType.number,
              ),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthNotVerifyState) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ),
                    );
                  } else if (state is AuthIsVerifyState) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const RootScreen(),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return MainBottom(
                      onPressed: () {
                        BlocProvider.of<AuthCubit>(context)
                            .checkOtp(widget.number, controller.text);
                      },
                      text: AppStrings.next,
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
