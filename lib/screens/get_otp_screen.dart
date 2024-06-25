import 'package:clock_shop/gen/assets.gen.dart';
import 'package:clock_shop/res/dimends.dart';
import 'package:clock_shop/res/extions.dart';
import 'package:clock_shop/res/string.dart';
import 'package:clock_shop/widget/app_text_feild.dart';
import 'package:clock_shop/widget/main_bottom.dart';
import 'package:flutter/material.dart';

class GetOtpScreen extends StatelessWidget {
  const GetOtpScreen({super.key});

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
                    .replaceAll(AppStrings.replace, '09139936173'),
              ),
              AppDimes.medium.hight,
              const Text(AppStrings.wrongNumberEditNumber),
              AppDimes.large.hight,
              MyAppTextFelid(
                label: AppStrings.enterVerificationCode,
                hint: AppStrings.hintVerificationCode,
                caption: '2:30',
                controller: controller,
              ),
              MainBottom(
                onPressed: () {},
                text: AppStrings.next,
              )
            ],
          ),
        ),
      ),
    );
  }
}
