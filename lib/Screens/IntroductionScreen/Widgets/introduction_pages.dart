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

const notWhiteTitleStyle = TextStyle(
  fontSize: 25.0,
  color: AppColors.backgroundColor,
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
              width: Get.width / 1.058,
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
        Text('titleSecond'.tr, style: titleStyle, textAlign: TextAlign.center),
        SizedBox(height: Get.height / 16.8),
        IntroductionRow(
            image: ImagesPath.electricConsumption,
            text: 'electricConsumption'.tr),
        SizedBox(height: Get.height / 33.6),
        IntroductionRow(
            image: ImagesPath.fuelConsumption, text: 'fuelConsum'.tr),
        SizedBox(height: Get.height / 33.6),
        IntroductionRowWater(
            image: ImagesPath.waterConsumption, text: 'waterConsum'.tr),
        SizedBox(height: Get.height / 33.6),
        IntroductionRow(
            image: ImagesPath.foodConsumption, text: 'foodConsum'.tr),
        SizedBox(height: Get.height / 33.6),
        Text('andMore'.tr, style: bodyStyle),
      ],
    ),
  );
}
