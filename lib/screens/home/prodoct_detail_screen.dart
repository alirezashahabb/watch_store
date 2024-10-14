import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store/components/text_style.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/dimends.dart';
import 'package:watch_store/res/extions.dart';
import 'package:watch_store/res/string.dart';
import 'package:watch_store/widget/custom_appbar.dart';
import 'package:watch_store/widget/main_bottom.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(Assets.svg.close),
            ),
            const Text(
              'ساعت هوشمند',
              style: AppTextStyles.productTitle,
            ),
            const CartBadge(
              count: 3,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: 240,
              height: 360,
              child: Image.asset(
                Assets.png.unnamed.path,
              ),
            ),
            AppDimes.small.hight,
            Padding(
              padding: const EdgeInsets.all(AppDimes.small),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'بنسر',
                    style: AppTextStyles.productTitle,
                  ),
                  Text('مسواک بنسر مدل اکسترا با برس متوسط 3 عددی',
                      style: AppTextStyles.productTitle.copyWith(fontSize: 14)),
                  AppDimes.small.hight,
                  const Text('خصوصیات ', style: AppTextStyles.productTitle),
                  Text(
                    'یلیبببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببببب',
                    style: AppTextStyles.unSelectedTab,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(AppDimes.medium),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 110,
                    height: 50,
                    child: MainBottom(
                      text: AppStrings.addToBasket,
                      onPressed: () {},
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 20,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              '20%',
                              style: AppTextStyles.mainbuttn,
                            ),
                          ),
                          AppDimes.small.width,
                          const Text(
                            '4300000تومان',
                            style: AppTextStyles.title,
                          ),
                        ],
                      ),
                      AppDimes.small.hight,
                      const Text(
                        '4300000تومان',
                        style: AppTextStyles.oldPriceStyle,
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: size.height * .07))
          ],
        ),
      ),
    );
  }
}
