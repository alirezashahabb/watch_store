import 'package:carousel_slider/carousel_slider.dart';
import 'package:clock_shop/gen/assets.gen.dart';
import 'package:clock_shop/res/color.dart';
import 'package:clock_shop/res/dimends.dart';
import 'package:clock_shop/res/string.dart';
import 'package:clock_shop/widget/category_items.dart';
import 'package:clock_shop/widget/search_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // search bar
            SearchBtn(
              onTap: () {},
            ),
            // AppSlider
            const AppSlider(),
            // Category Section
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CategoryItems(
                  categoryName: AppStrings.classic,
                  imagePath: Assets.svg.clasic,
                  linerColors: AppColors.catClasicColors,
                  onTap: () {},
                ),
                CategoryItems(
                  categoryName: AppStrings.smart,
                  imagePath: Assets.svg.smart,
                  linerColors: AppColors.catSmartColors,
                  onTap: () {},
                ),
                CategoryItems(
                  categoryName: AppStrings.digital,
                  imagePath: Assets.svg.digital,
                  linerColors: AppColors.catDigitalColors,
                  onTap: () {},
                ),
                CategoryItems(
                  categoryName: AppStrings.desktop,
                  imagePath: Assets.svg.desktop,
                  linerColors: AppColors.catDesktopColors,
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// this Widget for AppSlider on Application
class AppSlider extends StatelessWidget {
  const AppSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final CarouselController carouselController = CarouselController();
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: CarouselSlider(
        carouselController: carouselController,
        options: CarouselOptions(
          autoPlay: true,
        ),
        items: [
          Container(
            margin: const EdgeInsets.all(AppDimes.medium),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(AppDimes.medium),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(AppDimes.medium),
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(AppDimes.medium),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(AppDimes.medium),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(AppDimes.medium),
            ),
          ),
        ],
      ),
    );
  }
}
