import 'package:flutter/material.dart';

extension SizeBoxExciton on double {
  SizedBox get hight => SizedBox(
        height: toDouble(),
      );
  SizedBox get width => SizedBox(
        width: toDouble(),
      );
}
