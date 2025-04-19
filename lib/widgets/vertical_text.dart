import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store/component/text_style.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/dimens.dart';

class VerticalText extends StatelessWidget {
  final String title;
  const VerticalText({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        AppDimens.small,
      ),
      child: RotatedBox(
        quarterTurns: -1,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'مشاهده همه',
                  style: AppTextStyles.title,
                ),
                SvgPicture.asset(
                  Assets.svg.back,
                )
              ],
            ),
            Text(
              title,
              style: AppTextStyles.amazingStyle,
            ),
          ],
        ),
      ),
    );
  }
}
