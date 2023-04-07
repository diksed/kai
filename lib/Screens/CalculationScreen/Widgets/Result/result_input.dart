import 'package:flutter/material.dart';
import 'package:kai/Screens/CalculationScreen/Widgets/Result/single_result_container.dart';
import 'package:kai/Utils/app_texts.dart';

import 'circle_chart.dart';

Widget resultInput() {
  return SizedBox(
    height: 420,
    width: 310,
    child: Column(
      children: [
        const CircleGraphic(),
        const SizedBox(height: 20),
        resultContainer(ImagesPath.electricConsumption,
            IntroductionText.electricConsumption, 456, 'Kg'),
        const SizedBox(height: 10),
        resultContainer(ImagesPath.warmingConsumption,
            IntroductionText.warmingValues, 456, 'Kg'),
        const SizedBox(height: 10),
        resultContainer(ImagesPath.fuelConsumption,
            IntroductionText.fuelConsumption, 456, 'Kg'),
        const SizedBox(height: 10),
        resultContainer(ImagesPath.foodConsumption,
            IntroductionText.foodConsumption, 456, 'Kg'),
        const SizedBox(height: 10),
        resultContainer(
            ImagesPath.carboonFootprint, IntroductionText.totalco2, 456, 'Ton'),
      ],
    ),
  );
}
