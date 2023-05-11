import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kai/Screens/CalculationScreen/Widgets/Result/single_result_container.dart';
import 'package:kai/Utils/app_texts.dart';

import 'circle_chart.dart';

Widget resultInput(double electricResult, double warmingResult,
    double fuelResult, double foodResult, double totalCo2) {
  return SizedBox(
    height: Get.height / 1.6,
    width: 310,
    child: Column(
      children: [
        CircleGraphic(
            totalCo2: totalCo2,
            electricResult: electricResult,
            warmingResult: warmingResult,
            fuelResult: fuelResult,
            foodResult: foodResult),
        SizedBox(height: Get.height / 33.6),
        resultContainer(
            ImagesPath.electricConsumption,
            IntroductionText.electricConsumption,
            electricResult.toStringAsFixed(1),
            KeyTexts.kg),
        SizedBox(height: Get.height / 67.2),
        resultContainer(
            ImagesPath.warmingConsumption,
            IntroductionText.warmingValues,
            warmingResult.toStringAsFixed(1),
            KeyTexts.kg),
        SizedBox(height: Get.height / 67.2),
        resultContainer(
            ImagesPath.fuelConsumption,
            IntroductionText.fuelConsumption,
            fuelResult.toStringAsFixed(1),
            KeyTexts.kg),
        SizedBox(height: Get.height / 67.2),
        resultContainer(
            ImagesPath.foodConsumption,
            IntroductionText.foodConsumption,
            foodResult.toStringAsFixed(1),
            KeyTexts.kg),
        SizedBox(height: Get.height / 67.2),
        resultContainer(ImagesPath.carboonFootprint, IntroductionText.totalco2,
            (totalCo2 / 1000).toStringAsFixed(2), KeyTexts.tonne),
      ],
    ),
  );
}
