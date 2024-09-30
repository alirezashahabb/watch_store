import 'dart:async';

import 'package:flutter/material.dart';
import 'package:watch_store/components/image_loading_servie.dart';
import 'package:watch_store/components/text_style.dart';
import 'package:watch_store/data/model/product.dart';
import 'package:watch_store/res/color.dart';
import 'package:watch_store/res/dimends.dart';
import 'package:watch_store/res/extions.dart';
import 'package:watch_store/utils/format_time.dart';

class ProductItem extends StatefulWidget {
  ProductItem({
    super.key,
    required this.product,
  });
  ProductModel product;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  Duration _duration = const Duration(seconds: 0);
  late Timer _timer;
  int insecond = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timer = Timer(_duration, () {});
    if (widget.product.special_expiration != "") {
      DateTime now = DateTime.now();
      DateTime expiration = DateTime.parse(widget.product.special_expiration);
      _duration = now.difference(expiration).abs();
      insecond = _duration.inSeconds;
      startTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimes.small),
      margin: const EdgeInsets.all(AppDimes.medium),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimes.medium),
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: AppColors.productBgGradiant)),
      width: 200,
      child: Column(
        children: [
          ImageLoadingService(mainImage: widget.product.image),
          Align(
              alignment: Alignment.centerRight,
              child: Text(
                widget.product.title,
                style: AppTextStyles.productTitle,
              )),
          AppDimes.medium.hight,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    " ${widget.product.price.sporterNumber} تومان",
                    style: AppTextStyles.title,
                  ),
                  Visibility(
                      visible: widget.product.discount > 0 ? true : false,
                      child: Text(
                        widget.product.discount_price.sporterNumber,
                        style: AppTextStyles.oldPriceStyle,
                      )),
                ],
              ),
              Visibility(
                visible: widget.product.discount > 0 ? true : false,
                child: Container(
                  padding: const EdgeInsets.all(AppDimes.small * .5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: Colors.red),
                  child: Text("${widget.product.discount} %"),
                ),
              )
            ],
          ),
          AppDimes.large.hight,
          Visibility(
              visible: _duration.inSeconds > 0 ? true : false,
              child: Container(
                height: 2,
                width: double.infinity,
                color: Colors.blue,
              )),
          AppDimes.medium.hight,
          Visibility(
              visible: _duration.inSeconds > 0 ? true : false,
              child: Text(
                formatTime(insecond),
                style: AppTextStyles.prodTimerStyle,
              ))
        ],
      ),
    );
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
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
