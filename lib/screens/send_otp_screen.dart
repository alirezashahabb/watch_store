import 'package:flutter/material.dart';
import 'package:watch_store/component/extention.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/res/strings.dart';
import 'package:watch_store/widgets/app_text_field.dart';

class SendOtpScreen extends StatelessWidget {
  const SendOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController = TextEditingController();
    Size size = MediaQuery.of(context).size;
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
            ],
          ),
        ),
      ),
    );
  }
}
