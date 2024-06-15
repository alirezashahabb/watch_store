import 'package:flutter/material.dart';

extension SizeBoxExciton on num {
  SizedBox get hight => SizedBox(
        height: toDouble(),
      );
  SizedBox get width => SizedBox(
        width: toDouble(),
      );
}
