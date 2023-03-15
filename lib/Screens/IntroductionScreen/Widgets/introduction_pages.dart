import 'package:flutter/material.dart';
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
              height: 250.0,
              color: Colors.white.withOpacity(0.4),
              colorBlendMode: BlendMode.modulate),
          const SizedBox(height: 50),
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
          const SizedBox(height: 50),
        ],
      ));
}

Widget pageTwo() {
  return const Scaffold(
    backgroundColor: AppColors.backgroundColor,
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(IntroductionText.titleSecond,
            style: titleStyle, textAlign: TextAlign.center),
        SizedBox(height: 40),
        IntroductionRow(
            image: ImagesPath.electricConsumption,
            text: IntroductionText.electricConsumption),
        SizedBox(height: 20),
        IntroductionRow(
            image: ImagesPath.fuelConsumption,
            text: IntroductionText.fuelConsumption),
        SizedBox(height: 20),
        IntroductionRowWater(
            image: ImagesPath.waterConsumption,
            text: IntroductionText.waterConsumption),
        SizedBox(height: 20),
        IntroductionRow(
            image: ImagesPath.foodConsumption,
            text: IntroductionText.foodConsumption),
        SizedBox(height: 20),
        Text(DefaultTexts.andMore, style: bodyStyle),
      ],
    ),
  );
}
