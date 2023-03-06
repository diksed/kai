import 'package:flutter/material.dart';

import '../../../Utils/app_colors.dart';

BoxDecoration innerShadowEffect() {
  return BoxDecoration(
    boxShadow: [
      BoxShadow(color: Colors.black.withOpacity(0.5)),
      const BoxShadow(
        color: AppColors.backgroundColor,
        spreadRadius: -3,
        blurRadius: 13,
      ),
    ],
    borderRadius: BorderRadius.circular(15),
  );
}
