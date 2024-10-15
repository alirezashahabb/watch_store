import 'package:flutter/material.dart';
import 'package:watch_store/components/button_style.dart';
import 'package:watch_store/components/text_style.dart';

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
        child: Center(
          child: Text(
            text,
            style: AppTextStyles.mainbuttn.copyWith(fontSize: 14),
          ),
        ),
      ),
    );
  }
}
