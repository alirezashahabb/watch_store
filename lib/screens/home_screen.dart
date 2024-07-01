import 'package:clock_shop/gen/assets.gen.dart';
import 'package:clock_shop/res/color.dart';
import 'package:clock_shop/res/dimends.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(
                AppDimes.medium,
              ),
              decoration: BoxDecoration(
                  color: AppColors.searchBar,
                  borderRadius: BorderRadius.circular(60),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.shadow,
                      offset: Offset(0, 3),
                      blurRadius: 10,
                    )
                  ]),
              width: double.infinity,
              height: 54,
              child: Row(
                children: [
                  SvgPicture.asset(Assets.svg.search),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
