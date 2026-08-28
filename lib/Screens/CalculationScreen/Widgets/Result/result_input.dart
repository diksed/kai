import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kai/Screens/CalculationScreen/Widgets/Result/single_result_container.dart';
import 'package:kai/Utils/app_texts.dart';
import 'package:kai/Utils/number_format.dart';

import 'circle_chart.dart';

Widget resultInput(double electricResult, double warmingResult,
    double fuelResult, double foodResult, double totalCo2) {
  return SizedBox(
    height: Get.height / 1.6,
    width: Get.width / 1.161,
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
            'electricConsumption'.tr,
            formatCo2Value(electricResult),
            'kg'.tr),
        SizedBox(height: Get.height / 67.2),
        resultContainer(ImagesPath.warmingConsumption, 'warmingValues'.tr,
            formatCo2Value(warmingResult), 'kg'.tr),
        SizedBox(height: Get.height / 67.2),
        resultContainer(ImagesPath.fuelConsumption, 'fuelConsum'.tr,
            formatCo2Value(fuelResult), 'kg'.tr),
        SizedBox(height: Get.height / 67.2),
        resultContainer(ImagesPath.foodConsumption, 'foodConsum'.tr,
            formatCo2Value(foodResult), 'kg'.tr),
        SizedBox(height: Get.height / 67.2),
        resultContainer(ImagesPath.carboonFootprint, 'totalco2'.tr,
            formatCo2Value(totalCo2 / 1000, maxDecimals: 2), 'tonne'.tr),
      ],
    ),
  );
}
