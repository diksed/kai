import 'package:flutter/material.dart';
import 'package:kai/Utils/app_colors.dart';

import 'inner_shadow_effect.dart';

Stack calculationIndicator(int indicatorIndex) {
  return Stack(
    children: [
      Container(
          height: 30,
          width: 300,
          decoration: innerShadowEffect(AppColors.indicatorBackground)),
      Container(
        height: 30,
        width: indicatorIndex.toDouble(),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.white),
      ),
    ],
  );
}
