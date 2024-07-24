import 'package:clock_shop/components/text_style.dart';
import 'package:clock_shop/gen/assets.gen.dart';
import 'package:clock_shop/res/dimends.dart';
import 'package:clock_shop/res/string.dart';
import 'package:clock_shop/widget/app_text_feild.dart';
import 'package:clock_shop/widget/avatar_profile.dart';
import 'package:clock_shop/widget/main_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: RegitrationAppBar(size: size),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(AppDimes.medium, AppDimes.medium,
              AppDimes.medium, AppDimes.medium),
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
                label: AppStrings.homeNumber,
                hint: AppStrings.hintHomeNumber,
                controller: controller,
              ),
              MyAppTextFelid(
                label: AppStrings.address,
                hint: AppStrings.hintAddress,
                controller: controller,
              ),
              MyAppTextFelid(
                label: AppStrings.postalCode,
                hint: AppStrings.hintPostalCode,
                controller: controller,
              ),
              MyAppTextFelid(
                label: AppStrings.location,
                hint: AppStrings.hintLocation,
                controller: controller,
                icon: const Icon(Icons.location_on),
              ),
              MainBottom(onPressed: () {}, text: AppStrings.next),
            ],
          ),
        ),
      ),
    );
  }
}

class RegitrationAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RegitrationAppBar({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: Size(size.width, size.height),
        child: Padding(
          padding: const EdgeInsets.all(AppDimes.medium),
          child: SizedBox(
            width: size.width,
            height: size.height * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.register,
                  style: AppTextStyles.title.copyWith(
                    fontSize: 17,
                  ),
                ),
                SvgPicture.asset(Assets.svg.back),
              ],
            ),
          ),
        ));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(size.height * 0.1);
}
