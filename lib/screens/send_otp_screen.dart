import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_store/component/extention.dart';
import 'package:watch_store/component/navigator.dart';
import 'package:watch_store/component/snack_bar.dart';
import 'package:watch_store/cubit/auth_cubit.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/res/strings.dart';
import 'package:watch_store/screens/get_otp_screen.dart';
import 'package:watch_store/widgets/app_text_field.dart';
import 'package:watch_store/widgets/main_button.dart';

class SendOtpScreen extends StatelessWidget {
  const SendOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Assets.png.mainLogo.image(),
              AppDimens.large.height,
              AppTextField(
                lable: AppStrings.enterYourNumber,
                controller: phoneController,
                hint: AppStrings.hintPhoneNumber,
              ),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthSuccessState) {
                    goScreen(
                      context: context,
                      screen: GetOptScreen(
                        mobile: state.mobile,
                      ),
                    );
                    showCustomAlert(
                      context,
                      'کد با موفقیت ارسال شد!',
                    );
                  } else if (state is AuthErrorState) {
                    showCustomAlert(
                      context,
                      'خطایی رخ داده هست!',
                      AlertType.error,
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
                        context.read<AuthCubit>().sendSms(
                              phoneController.text,
                            );
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
