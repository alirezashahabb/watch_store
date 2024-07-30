import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store/components/text_style.dart';
import 'package:watch_store/gen/assets.gen.dart';

/// this is Vertical Text for Best offers Slider
class VerticalTextBestSeller extends StatelessWidget {
  const VerticalTextBestSeller({
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
          const Text(
            'پیشنهاد شگفت انگیز',
            style: AppTextStyles.amazingStyle,
          ),
        ],
      ),
    );
  }
}
