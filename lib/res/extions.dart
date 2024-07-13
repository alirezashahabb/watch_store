import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension SizeBoxExciton on double {
  SizedBox get hight => SizedBox(
        height: toDouble(),
      );
  SizedBox get width => SizedBox(
        width: toDouble(),
      );
}

/// this is for sporterNumber Price
extension IntExcitons on int {
  String get sporterNumber {
    final numberFormat = NumberFormat.decimalPattern();
    return numberFormat.format(this);
  }
}
