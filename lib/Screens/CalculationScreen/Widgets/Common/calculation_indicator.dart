import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kai/Utils/app_colors.dart';

import 'inner_shadow_effect.dart';

Stack calculationIndicator(int indicatorIndex) {
  return Stack(
    children: [
      Container(
          height: Get.height / 22.4,
          width: Get.width / 1.2,
          decoration: innerShadowEffect(AppColors.indicatorBackground)),
      Container(
        height: Get.height / 22.4,
        width: indicatorIndex.toDouble(),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.white),
      ),
    ],
  );
}
