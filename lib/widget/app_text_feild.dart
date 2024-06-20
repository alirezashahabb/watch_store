import 'package:clock_shop/res/dimends.dart';
import 'package:clock_shop/res/extions.dart';
import 'package:flutter/material.dart';

class MyAppTextFelid extends StatelessWidget {
  final String label;
  final String hint;
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
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(
          AppDimes.medium,
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(label),
              AppDimes.medium.hight,
              SizedBox(
                height: size.height * .07,
                width: size.height * .75,
                child: TextField(
                  controller: controller,
                  textAlign: textAlign,
                  keyboardType: type,
                  decoration: InputDecoration(
                    hintText: hint,
                    prefix: icon,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
