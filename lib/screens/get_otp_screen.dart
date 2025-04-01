import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_store/component/extention.dart';
import 'package:watch_store/component/navigator.dart';
import 'package:watch_store/component/snack_bar.dart';
import 'package:watch_store/component/text_style.dart';
import 'package:watch_store/cubit/auth_cubit.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/register/register_screen.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/res/strings.dart';
import 'package:watch_store/screens/root_screen.dart';
import 'package:watch_store/utils/format_time.dart';
import 'package:watch_store/widgets/app_text_field.dart';
import 'package:watch_store/widgets/main_button.dart';

class CheackSmsScreen extends StatefulWidget {
  final String mobile;

  const CheackSmsScreen({super.key, required this.mobile});

  @override
  State<CheackSmsScreen> createState() => _CheackSmsScreenState();
}

class _CheackSmsScreenState extends State<CheackSmsScreen> {
  TextEditingController smsController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  late Timer _timer;

  int _start = 120;

  startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        if (_start == 0) {
          _timer.cancel();
          Navigator.of(context).pop();
          showCustomAlert(
            context,
            'مدت زمان وارد کردن کد منقظی شده هست!',
            AlertType.error,
          );
        } else {
          _start--;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Assets.png.mainLogo.image(),
              AppDimens.medium.height,
              Text(
                AppStrings.otpCodeSendFor
                    .replaceAll(AppStrings.replace, widget.mobile),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  AppStrings.wrongNumberEditNumber,
                  style: AppTextStyles.primaryThemeTextStyle,
                ),
              ),
              AppDimens.large.height,
              AppTextField(
                lable: AppStrings.enterVerificationCode,
                controller: smsController,
                hint: AppStrings.hintVerificationCode,
                prefixLable: formatTime(_start),
                inputType: TextInputType.number,
              ),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  _timer.cancel();
                  if (state is AuthVefiyIsRegistredState) {
                    goScreen(context: context, screen: RootScreen());
                    showCustomAlert(context, 'خوش آمدید');
                  } else if (state is AuthVefiyNotRegistredState) {
                    goScreen(context: context, screen: RegisterScreen());
                    showCustomAlert(
                      context,
                      'لطفا اطلاعات کاربری مربوطه را به درستی وارد نمایید',
                      AlertType.warning,
                    );
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return MainButton(
                      text: AppStrings.next,
                      onPressed: () {
                        context
                            .read<AuthCubit>()
                            .cheackSms(widget.mobile, smsController.text);
                      },
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
