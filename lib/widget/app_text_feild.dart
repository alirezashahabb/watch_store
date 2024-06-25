import 'package:clock_shop/components/text_style.dart';
import 'package:clock_shop/res/dimends.dart';
import 'package:clock_shop/res/extions.dart';
import 'package:flutter/material.dart';

class MyAppTextFelid extends StatelessWidget {
  final String label;
  final String hint;
  final String caption;
  final TextEditingController controller;
  final Widget icon;
  final TextAlign textAlign;
  final TextInputType? type;
  const MyAppTextFelid({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.icon = const SizedBox(),
    this.textAlign = TextAlign.center,
    this.type,
    this.caption = '',
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: size.height * .75,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label,
                  style: AppTextStyles.title,
                ),
                Text(
                  caption,
                  style: AppTextStyles.title,
                ),
              ],
            ),
          ),
          AppDimes.medium.hight,
          SizedBox(
            height: size.height * .07,
            width: size.height * .75,
            child: TextField(
              controller: controller,
              textAlign: textAlign,
              keyboardType: type,
              decoration: InputDecoration(
                hintStyle: AppTextStyles.oldPriceStyle,
                hintText: hint,
                prefix: icon,
              ),
            ),
          ),
          const SizedBox(
            height: AppDimes.large,
          )
        ],
      ),
    );
  }
}
