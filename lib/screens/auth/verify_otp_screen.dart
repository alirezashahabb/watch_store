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

class VerifyOtpScreen extends StatelessWidget {
  final String number;
  const VerifyOtpScreen({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    // get phone number to previous page

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
                    .replaceAll(AppStrings.replace, number),
                style: AppTextStyles.title,
              ),
              AppDimes.medium.hight,
              const Text(
                AppStrings.wrongNumberEditNumber,
                style: AppTextStyles.primaryThemeTextStyle,
              ),
              AppDimes.large.hight,
              MyAppTextFelid(
                label: AppStrings.enterVerificationCode,
                hint: AppStrings.hintVerificationCode,
                caption: '2:30',
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
                            .checkOtp(number, controller.text);
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
