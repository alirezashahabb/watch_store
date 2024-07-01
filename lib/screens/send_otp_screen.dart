import 'package:clock_shop/gen/assets.gen.dart';
import 'package:clock_shop/res/dimends.dart';
import 'package:clock_shop/res/extions.dart';
import 'package:clock_shop/res/string.dart';
import 'package:clock_shop/widget/app_text_feild.dart';
import 'package:clock_shop/widget/main_bottom.dart';
import 'package:flutter/material.dart';

class SendOtpScreen extends StatelessWidget {
  const SendOtpScreen({super.key});

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
