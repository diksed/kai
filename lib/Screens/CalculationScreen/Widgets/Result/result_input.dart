import 'package:flutter/material.dart';
import 'package:kai/Screens/CalculationScreen/Widgets/Result/single_result_container.dart';
import 'package:kai/Utils/app_texts.dart';

import 'circle_chart.dart';

Widget resultInput(
  var electricResult,
  var warmingResult,
  var fuelResult,
) {
  return SizedBox(
    height: 420,
    width: 310,
    child: Column(
      children: [
        const CircleGraphic(),
        const SizedBox(height: 20),
        resultContainer(ImagesPath.electricConsumption,
            IntroductionText.electricConsumption, electricResult, 'Kg'),
        const SizedBox(height: 10),
        resultContainer(ImagesPath.warmingConsumption,
            IntroductionText.warmingValues, warmingResult, 'Kg'),
        const SizedBox(height: 10),
        resultContainer(ImagesPath.fuelConsumption,
            IntroductionText.fuelConsumption, fuelResult, 'Kg'),
        const SizedBox(height: 10),
        resultContainer(ImagesPath.foodConsumption,
            IntroductionText.foodConsumption, 2, 'Kg'),
        const SizedBox(height: 10),
        resultContainer(
            ImagesPath.carboonFootprint, IntroductionText.totalco2, 3, 'Ton'),
      ],
    ),
  );
}
