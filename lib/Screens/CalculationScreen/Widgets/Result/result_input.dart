import 'package:flutter/material.dart';
import 'package:kai/Screens/CalculationScreen/Widgets/Result/single_result_container.dart';
import 'package:kai/Utils/app_texts.dart';

import 'circle_chart.dart';

Widget resultInput(double electricResult, double warmingResult,
    double fuelResult, double foodResult, double totalCo2) {
  return SizedBox(
    height: 420,
    width: 310,
    child: Column(
      children: [
        CircleGraphic(
            totalCo2: totalCo2,
            electricResult: electricResult,
            warmingResult: warmingResult,
            fuelResult: fuelResult,
            foodResult: foodResult),
        const SizedBox(height: 20),
        resultContainer(
            ImagesPath.electricConsumption,
            IntroductionText.electricConsumption,
            electricResult.toStringAsFixed(1),
            KeyTexts.kg),
        const SizedBox(height: 10),
        resultContainer(
            ImagesPath.warmingConsumption,
            IntroductionText.warmingValues,
            warmingResult.toStringAsFixed(1),
            KeyTexts.kg),
        const SizedBox(height: 10),
        resultContainer(
            ImagesPath.fuelConsumption,
            IntroductionText.fuelConsumption,
            fuelResult.toStringAsFixed(1),
            KeyTexts.kg),
        const SizedBox(height: 10),
        resultContainer(
            ImagesPath.foodConsumption,
            IntroductionText.foodConsumption,
            foodResult.toStringAsFixed(1),
            KeyTexts.kg),
        const SizedBox(height: 10),
        resultContainer(ImagesPath.carboonFootprint, IntroductionText.totalco2,
            (totalCo2 / 1000).toStringAsFixed(2), KeyTexts.tonne),
      ],
    ),
  );
}
