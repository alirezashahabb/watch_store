import 'dart:async';

import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_store/components/text_style.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/dimends.dart';
import 'package:watch_store/res/extions.dart';
import 'package:watch_store/res/string.dart';
import 'package:watch_store/screens/auth/cubit/auth_cubit.dart';
import 'package:watch_store/screens/register/register_screen.dart';
import 'package:watch_store/screens/root_screen.dart';
import 'package:watch_store/utils/format_time.dart';
import 'package:watch_store/widget/app_text_feild.dart';
import 'package:watch_store/widget/main_bottom.dart';

class VerifyOtpScreen extends StatefulWidget {
  final String number;
  const VerifyOtpScreen({super.key, required this.number});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final TextEditingController controller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  late Timer maintimer;
  int start = 120;

  startTimer() {
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

  @override
  Widget build(BuildContext context) {
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
                caption: formatTime(start),
                controller: controller,
                type: TextInputType.number,
              ),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  maintimer.cancel();
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
