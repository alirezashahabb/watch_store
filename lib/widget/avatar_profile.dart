import 'package:clock_shop/components/text_style.dart';
import 'package:clock_shop/gen/assets.gen.dart';
import 'package:clock_shop/res/dimends.dart';
import 'package:clock_shop/res/extions.dart';
import 'package:flutter/material.dart';

class AvatarImage extends StatelessWidget {
  final String title;
  const AvatarImage({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Assets.png.avatar.image(
          width: 100,
          height: 100,
        ),
        AppDimes.medium.hight,
        Text(
          title,
          style: AppTextStyles.title,
        ),
      ],
    );
  }
}
