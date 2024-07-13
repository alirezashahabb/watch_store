import 'package:clock_shop/components/text_style.dart';
import 'package:clock_shop/gen/assets.gen.dart';
import 'package:clock_shop/res/color.dart';
import 'package:clock_shop/res/dimends.dart';
import 'package:clock_shop/res/extions.dart';
import 'package:flutter/material.dart';

/// this class for ProductItem
class ProductItem extends StatelessWidget {
  final String productName;
  final int price;
  final int oldPrice;
  final int discount;
  final int time;
  const ProductItem({
    super.key,
    required this.productName,
    required this.price,
    this.oldPrice = 0,
    this.discount = 0,
    this.time = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimes.small),
      margin: const EdgeInsets.all(AppDimes.medium),
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimes.small),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: AppColors.productBgGradiant,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppDimes.small),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Assets.png.unnamed.image(),
            Align(
              alignment: Alignment.centerRight,
              child: Text(productName, style: AppTextStyles.productTitle),
            ),
            AppDimes.small.hight,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: discount == 0 ? false : true,
                  child: Container(
                    width: 34,
                    height: 18,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(AppDimes.small),
                    ),
                    child: Text(
                      '$discount%',
                      style: AppTextStyles.mainbuttn,
                    ),
                  ),
                ),
                Text(price.sporterNumber)
              ],
            ),
            Visibility(
              visible: discount == 0 ? false : true,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  oldPrice.sporterNumber,
                  style: AppTextStyles.oldPriceStyle,
                ),
              ),
            ),
            AppDimes.small.hight,
            Visibility(
              visible: time == 0 ? false : true,
              child: const Divider(
                color: Colors.blue,
                thickness: 1.4,
              ),
            ),
            AppDimes.small.hight,
            Visibility(
              visible: time == 0 ? false : true,
              child: Text(
                '$time',
                style: AppTextStyles.prodTimerStyle,
              ),
            )
          ],
        ),
      ),
    );
  }
}
