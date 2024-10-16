import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:watch_store/components/text_style.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/color.dart';
import 'package:watch_store/res/dimends.dart';
import 'package:watch_store/res/extions.dart';
import 'package:watch_store/utils/image_handler.dart';
import 'package:watch_store/widget/avatar_profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final ImageHandler imageHandler = ImageHandler();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appbar,
        title: const Text(
          'پروفایل کاربر',
          style: AppTextStyles.productTitle,
        ),
        elevation: 4,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Avatar(
                  onTap: () async => await imageHandler
                      .pickAndCropImage(source: ImageSource.gallery)
                      .then((value) => setState(() {})),
                  file: imageHandler.getImage),
            ),
            AppDimes.small.hight,
            Padding(
              padding: const EdgeInsets.only(right: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'آدرس فعال',
                    style: AppTextStyles.title,
                  ),
                  AppDimes.small.hight,
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ',
                          style: AppTextStyles.caption,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                      AppDimes.small.width,
                      SvgPicture.asset(
                        Assets.svg.leftArrow,
                      )
                    ],
                  ),
                  AppDimes.medium.hight,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(Assets.svg.postalCode),
                      AppDimes.small.width,
                      Text(
                        '12345565656',
                        style: AppTextStyles.caption,
                      )
                    ],
                  ),
                  AppDimes.medium.hight,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(Assets.svg.userMenu),
                      AppDimes.small.width,
                      Text(
                        'علیرصا شهاب',
                        style: AppTextStyles.caption,
                      )
                    ],
                  ),
                  AppDimes.medium.hight,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(Assets.svg.phone),
                      AppDimes.small.width,
                      Text(
                        '093938197375',
                        style: AppTextStyles.caption,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            AppDimes.large.hight,
            Container(
              margin: const EdgeInsets.all(AppDimes.medium),
              padding: const EdgeInsets.all(AppDimes.medium),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xffF3F3F3),
                borderRadius: BorderRadius.circular(AppDimes.small),
              ),
              child: const Text(
                'قوانین مقررات',
                style: AppTextStyles.avatarText,
              ),
            ),
            AppDimes.large.hight,
            Container(
              margin: const EdgeInsets.all(AppDimes.medium),
              padding: const EdgeInsets.all(AppDimes.medium),
              height: 183,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xffF3F3F3),
                borderRadius: BorderRadius.circular(AppDimes.small),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: AppDimes.large),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        SvgPicture.asset(
                          Assets.svg.inProccess,
                        ),
                        AppDimes.medium.hight,
                        const Text(
                          'در حال پردازش',
                          style: AppTextStyles.title,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        SvgPicture.asset(
                          Assets.svg.cancelled,
                        ),
                        AppDimes.medium.hight,
                        const Text(
                          'لفو شده',
                          style: AppTextStyles.title,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        SvgPicture.asset(
                          Assets.svg.delivered,
                        ),
                        AppDimes.medium.hight,
                        const Text(
                          'تحویل داده شده',
                          style: AppTextStyles.title,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.all(AppDimes.medium),
                height: 115,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    AppDimes.small,
                  ),
                ),
                child: Assets.png.watchProfile.image(fit: BoxFit.fill))
          ],
        ),
      ),
    );
  }
}
