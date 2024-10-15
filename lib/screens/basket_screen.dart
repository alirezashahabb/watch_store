import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_store/components/text_style.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/color.dart';
import 'package:watch_store/res/extions.dart';
import 'package:watch_store/widget/main_bottom.dart';

import '../res/dimends.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appbar,
        title: const Text(
          'سبد خرید',
          style: AppTextStyles.productTitle,
        ),
        elevation: 4,
      ),
      body: Column(
        children: [
          Container(
            height: 80,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.appbar,
              boxShadow: [
                BoxShadow(
                  blurRadius: 3,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'آدرس',
                        style: AppTextStyles.unSelectedTab,
                      ),
                      const Text(
                        'لورم یک متن تستی ......',
                        style: AppTextStyles.productTitle,
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    Assets.svg.leftArrow,
                  )
                ],
              ),
            ),
          ),
          AppDimes.medium.hight,
          SizedBox(
            height: 450,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  height: 184,
                  width: double.infinity,
                  margin: const EdgeInsets.all(AppDimes.medium),
                  decoration: BoxDecoration(
                      color: const Color(0xffF3F3F3),
                      borderRadius: BorderRadius.circular(AppDimes.small)),
                  child: Row(
                    children: [
                      Assets.png.unnamed.image(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppDimes.small.hight,
                          const Text(
                            'ساعت شیائومی mi Watch lite',
                            style: AppTextStyles.title,
                          ),
                          AppDimes.small.hight,
                          Text(
                            'قیمت: 40000 تومان',
                            style: AppTextStyles.unSelectedTab,
                          ),
                          AppDimes.small.hight,
                          const Text(
                            'با تخقیف : 50000 تومان',
                            style: AppTextStyles.primaryThemeTextStyle,
                          ),
                          AppDimes.small.hight,
                          Container(
                            width: 200,
                            height: 1,
                            color: AppColors.amazingColor,
                          ),
                          AppDimes.small.hight,
                          Row(
                            children: [
                              SvgPicture.asset(
                                Assets.svg.plus,
                              ),
                              AppDimes.small.width,
                              const Text('1'),
                              AppDimes.small.width,
                              SvgPicture.asset(
                                Assets.svg.minus,
                              ),
                              const SizedBox(
                                width: 80,
                              ),
                              SvgPicture.asset(
                                Assets.svg.delete,
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(AppDimes.medium),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: 130,
                    height: 50,
                    child: MainBottom(
                        onPressed: () {}, text: 'ادامه فرایند خرید')),
                const Text(
                  'مجموع 63,5000 تومان',
                  style: AppTextStyles.title,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
