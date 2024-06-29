import 'package:clock_shop/components/text_style.dart';
import 'package:clock_shop/gen/assets.gen.dart';
import 'package:clock_shop/res/dimends.dart';
import 'package:clock_shop/res/extions.dart';
import 'package:flutter/material.dart';

class AvatarImage extends StatelessWidget {
  final String titleAvatar;
  const AvatarImage({
    super.key,
    required this.titleAvatar,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Assets.png.avatar.image(),
        ),
        AppDimes.medium.hight,
        Text(
          titleAvatar,
          style: AppTextStyles.avatarText,
        ),
      ],
    );
  }
}
