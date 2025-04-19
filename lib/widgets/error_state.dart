import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:watch_store/component/extention.dart';
import 'package:watch_store/component/text_style.dart';
import 'package:watch_store/res/dimens.dart';

class ErrorScreen extends StatelessWidget {
  final void Function() onTap;
  const ErrorScreen({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Center(
        child: Column(mainAxisSize: MainAxisSize.max, spacing: 12, children: [
          AppDimens.large.height,
          LottieBuilder.asset(
            'assets/png/animation.json',
            animate: true,
            repeat: true,
            height: 200,
          ),
          Text(
            'ای بابا ! در حال  حاضر مشکلی رخ داده',
            style: AppTextStyles.amazingStyle,
          ),
          ElevatedButton(
            onPressed: onTap,
            child: Text(
              'تلاش مجدد',
              style: AppTextStyles.mainbuttn,
            ),
          )
        ]),
      ),
    );
  }
}
