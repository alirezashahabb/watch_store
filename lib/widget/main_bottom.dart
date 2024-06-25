import 'package:clock_shop/components/button_style.dart';
import 'package:clock_shop/components/text_style.dart';
import 'package:flutter/material.dart';

class MainBottom extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  const MainBottom({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * .07,
      width: size.height * .75,
      child: ElevatedButton(
        style: AppButtonStyles.mainButtonStyle,
        onPressed: onPressed,
        child: Text(
          text,
          style: AppTextStyles.mainbuttn,
        ),
      ),
    );
  }
}
