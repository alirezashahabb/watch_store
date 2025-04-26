import 'dart:async';

import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:watch_store/component/navigator.dart';
import 'package:watch_store/component/text_style.dart';
import 'package:watch_store/res/colors.dart';
import 'package:watch_store/res/dimens.dart';
import 'package:watch_store/screens/prodoct/prodoct_detail_screen.dart';
import 'package:watch_store/utils/format_time.dart';
import 'package:watch_store/utils/image_loading_service.dart';

class ProductItems extends StatefulWidget {
  final String productName;
  final oldPrice;
  final String price;
  final specialExpiration;
  final discount;
  final String image;
  final int id;

  const ProductItems({
    super.key,
    required this.productName,
    this.oldPrice = 0,
    required this.price,
    this.specialExpiration = '',
    this.discount = 0,
    required this.image,
    required this.id,
  });

  @override
  State<ProductItems> createState() => _ProductItemsState();
}

class _ProductItemsState extends State<ProductItems> {
  Duration _duration = Duration(seconds: 0);
  late Timer timer;
  int insecond = 0;
  @override
  void initState() {
    timer = Timer(_duration, () {});
    if (widget.specialExpiration != "") {
      DateTime now = DateTime.now();
      DateTime expiration = DateTime.parse(widget.specialExpiration);
      _duration = now.difference(expiration).abs();
      insecond = _duration.inSeconds;
      startTimer();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        goScreen(
          context: context,
          screen: ProdoctDetailScreen(
            id: widget.id,
          ),
        );
      },
      child: Container(
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
            SizedBox(
                height: 140,
                child: ImageLoadingService(mainImage: widget.image)),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                widget.productName,
                style: AppTextStyles.productTitle,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Visibility(
                  visible: widget.discount > 0 ? true : false,
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
                      '${widget.discount}%',
                      style: AppTextStyles.mainbuttn,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${widget.price}تومان'.seRagham(),
                      style: AppTextStyles.title,
                    ),
                    Visibility(
                      visible: widget.discount > 0 ? true : false,
                      child: Text(
                        '${widget.oldPrice}'.seRagham(),
                        style: AppTextStyles.oldPriceStyle,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Visibility(
              visible: _duration.inSeconds > 0 ? true : false,
              child: Container(
                width: double.infinity,
                height: 2,
                color: AppColors.focusedBorderColor,
              ),
            ),
            Visibility(
              visible: _duration.inSeconds > 0 ? true : false,
              child: Text(
                formatTime(insecond),
                style: AppTextStyles.prodTimerStyle,
              ),
            )
          ],
        ),
      ),
    );
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        if (insecond == 0) {
          debugPrint("product onTap limited");
        } else {
          insecond--;
        }
      });
    });
  }
}
