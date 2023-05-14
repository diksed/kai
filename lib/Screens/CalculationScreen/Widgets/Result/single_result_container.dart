import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kai/Screens/CalculationScreen/Widgets/Common/inner_shadow_effect.dart';
import 'package:kai/Utils/app_colors.dart';

Widget resultContainer(String imagePath, String text, var result, String unit) {
  return Container(
    decoration: innerShadowEffect(AppColors.inputBackground),
    height: Get.height / 16.8,
    width: Get.width / 1.161,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(imagePath, height: Get.height / 19.2),
        Text(text, style: resultTextStyle),
        Text('$result $unit', style: resultTextStyle),
      ],
    ),
  );
}

const resultTextStyle = TextStyle(
  fontSize: 16.0,
  color: Colors.white,
  fontWeight: FontWeight.w400,
);
