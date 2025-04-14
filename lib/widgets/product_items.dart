import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:watch_store/component/text_style.dart';
import 'package:watch_store/gen/assets.gen.dart';
import 'package:watch_store/res/colors.dart';
import 'package:watch_store/res/dimens.dart';

class ProductItems extends StatelessWidget {
  final String productName;
  final oldPrice;
  final String price;
  final date;
  final discount;

  const ProductItems({
    super.key,
    required this.productName,
    this.oldPrice = 0,
    required this.price,
    this.date = 0,
    this.discount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        AppDimens.small,
      ),
      margin: EdgeInsets.only(
        left: AppDimens.large,
        right: AppDimens.medium,
      ),
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(AppDimens.medium),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: AppColors.productBgGradiant,
        ),
      ),
      child: Column(
        spacing: AppDimens.small,
        children: [
          Assets.png.unnamed.image(),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              productName,
              style: AppTextStyles.productTitle,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Visibility(
                visible: discount > 0 ? true : false,
                child: Container(
                  alignment: Alignment.center,
                  width: 50,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      AppDimens.medium,
                    ),
                    color: AppColors.error,
                  ),
                  child: Text(
                    discount,
                    style: AppTextStyles.mainbuttn,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '$price تومان'.seRagham(),
                    style: AppTextStyles.title,
                  ),
                  Visibility(
                    visible: discount > 0 ? true : false,
                    child: Text(
                      oldPrice.seRagham(),
                      style: AppTextStyles.oldPriceStyle,
                    ),
                  ),
                ],
              )
            ],
          ),
          Visibility(
            visible: date > 0 ? true : false,
            child: Container(
              width: double.infinity,
              height: 2,
              color: AppColors.focusedBorderColor,
            ),
          ),
          Visibility(
            visible: date > 0 ? true : false,
            child: Text(
              date,
              style: AppTextStyles.prodTimerStyle,
            ),
          )
        ],
      ),
    );
  }
}
