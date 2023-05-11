import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kai/Utils/app_colors.dart';
import 'package:kai/Utils/app_texts.dart';

import 'introduction_row.dart';

const bodyStyle = TextStyle(
  fontSize: 19.0,
  color: Colors.white,
  fontWeight: FontWeight.w400,
  height: 1.3,
  letterSpacing: 0.5,
);

const titleStyle = TextStyle(
  fontSize: 25.0,
  color: Colors.white,
  fontWeight: FontWeight.w600,
  height: 1.7,
  letterSpacing: 0.6,
);

Widget pageOneThird(String image, String text) {
  return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image,
              height: Get.height / 2.688,
              color: Colors.white.withOpacity(0.4),
              colorBlendMode: BlendMode.modulate),
          SizedBox(height: Get.height / 13.44),
          Center(
            child: SizedBox(
              width: 340,
              child: Text(
                text,
                style: bodyStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(height: Get.height / 13.44),
        ],
      ));
}

Widget pageTwo() {
  return Scaffold(
    backgroundColor: AppColors.backgroundColor,
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(IntroductionText.titleSecond,
            style: titleStyle, textAlign: TextAlign.center),
        SizedBox(height: Get.height / 16.8),
        const IntroductionRow(
            image: ImagesPath.electricConsumption,
            text: IntroductionText.electricConsumption),
        SizedBox(height: Get.height / 33.6),
        const IntroductionRow(
            image: ImagesPath.fuelConsumption,
            text: IntroductionText.fuelConsumption),
        SizedBox(height: Get.height / 33.6),
        const IntroductionRowWater(
            image: ImagesPath.waterConsumption,
            text: IntroductionText.waterConsumption),
        SizedBox(height: Get.height / 33.6),
        const IntroductionRow(
            image: ImagesPath.foodConsumption,
            text: IntroductionText.foodConsumption),
        SizedBox(height: Get.height / 33.6),
        const Text(DefaultTexts.andMore, style: bodyStyle),
      ],
    ),
  );
}
