import 'package:flutter/material.dart';
import 'package:watch_store/component/extention.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/res/strings.dart';
import 'package:watch_store/widgets/app_text_field.dart';
import 'package:watch_store/widgets/main_button.dart';

class GetOptScreen extends StatelessWidget {
  const GetOptScreen({super.key});

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
              AppDimens.medium.height,
              Text(
                AppStrings.otpCodeSendFor
                    .replaceAll(AppStrings.replace, '09916924158'),
              ),
              Text(
                AppStrings.wrongNumberEditNumber,
              ),
              AppDimens.large.height,
              AppTextField(
                lable: AppStrings.enterVerificationCode,
                controller: phoneController,
                hint: AppStrings.hintVerificationCode,
                prefixLable: '2:45',
              ),
              MainButton(
                text: AppStrings.next,
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
