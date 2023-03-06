import 'package:flutter/material.dart';

import 'inner_shadow_effect.dart';

Stack calculationIndicator(int indicatorIndex, bool onLastPage) {
  return Stack(
    children: [
      Container(
        height: onLastPage ? 0 : 30,
        width: onLastPage ? 0 : 300,
        decoration: innerShadowEffect(),
      ),
      Container(
        height: onLastPage ? 0 : 30,
        width: onLastPage ? 0 : indicatorIndex.toDouble(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
      ),
    ],
  );
}
