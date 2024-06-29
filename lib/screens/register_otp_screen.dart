import 'package:clock_shop/res/dimends.dart';
import 'package:clock_shop/res/string.dart';
import 'package:clock_shop/widget/app_text_feild.dart';
import 'package:clock_shop/widget/avatar_profile.dart';
import 'package:flutter/material.dart';

class RegisterOtp extends StatelessWidget {
  const RegisterOtp({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
            AppDimes.medium, AppDimes.medium, AppDimes.medium, AppDimes.medium),
        child: Column(
          children: [
            const AvatarImage(
              titleAvatar: AppStrings.chooseProfileImage,
            ),
            MyAppTextFelid(
              label: AppStrings.nameLastName,
              hint: AppStrings.hintNameLastName,
              controller: controller,
            ),
            MyAppTextFelid(
              label: AppStrings.nameLastName,
              hint: AppStrings.hintNameLastName,
              controller: controller,
            ),
            MyAppTextFelid(
              label: AppStrings.nameLastName,
              hint: AppStrings.hintNameLastName,
              controller: controller,
            ),
            MyAppTextFelid(
              label: AppStrings.nameLastName,
              hint: AppStrings.hintNameLastName,
              controller: controller,
            ),
            MyAppTextFelid(
              label: AppStrings.location,
              hint: AppStrings.hintLocation,
              controller: controller,
              icon: const Icon(Icons.location_on),
            ),
          ],
        ),
      ),
    );
  }
}
