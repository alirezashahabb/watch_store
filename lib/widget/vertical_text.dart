import 'package:clock_shop/components/text_style.dart';
import 'package:clock_shop/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// this is Vertical Text for Best offers Slider
class VerticalText extends StatelessWidget {
  const VerticalText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: -1,
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                'مشاهده همه',
                style: AppTextStyles.title,
              ),
              SvgPicture.asset(Assets.svg.back)
            ],
          ),
          Text(
            'پیشنهاد شگفت انگیز',
            style: AppTextStyles.title.copyWith(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
