import 'package:flutter/material.dart';
import '../../../Utils/app_colors.dart';

BoxDecoration innerShadowEffect() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    boxShadow: [
      BoxShadow(color: Colors.black.withOpacity(0.7)),
      const BoxShadow(
        offset: Offset(0, 3),
        color: AppColors.indicatorBackground,
        spreadRadius: 0,
        blurRadius: 15,
      ),
    ],
  );
}
