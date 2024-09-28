import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_store/components/text_style.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/dimends.dart';
import 'package:watch_store/res/extions.dart';
import 'package:watch_store/res/string.dart';
import 'package:watch_store/screens/auth/cubit/auth_cubit.dart';
import 'package:watch_store/widget/app_text_feild.dart';
import 'package:watch_store/widget/main_bottom.dart';

import 'verify_otp_screen.dart';

class SendSmsScreen extends StatelessWidget {
  const SendSmsScreen({super.key});

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
              AppDimes.large.hight,
              MyAppTextFelid(
                label: AppStrings.enterYourNumber,
                hint: AppStrings.hintPhoneNumber,
                type: TextInputType.number,
                controller: controller,
              ),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthSendSmsState) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          VerifyOtpScreen(number: state.number),
                    ));
                  } else if (state is AuthErrorState) {
                    return CherryToast.error(
                      title: const Text("خطایی رخ داده هست",
                          style: AppTextStyles.title),
                    ).show(context);
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
                            .sendSms(controller.text);
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
