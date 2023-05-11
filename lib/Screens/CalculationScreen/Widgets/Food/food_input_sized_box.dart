import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kai/Screens/CalculationScreen/Widgets/Electric/one_text_field_container.dart';
import 'package:kai/Utils/app_texts.dart';

import '../../../IntroductionScreen/Widgets/introduction_pages.dart';
import '../../calculation_controller.dart';

Widget foodInputSizedBox(CalculationController controller) {
  return SizedBox(
    height: Get.height / 2.584,
    width: 340,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text(MenuTexts.totalMeatConsumption, style: bodyStyle),
        SizedBox(height: Get.height / 134.4),
        oneTextFieldContainer(controller, controller.meatController, false,
            KeyTexts.kg, TextInputAction.next),
        SizedBox(height: Get.height / 67.2),
        const Text(MenuTexts.totalMilkConsumption, style: bodyStyle),
        SizedBox(height: Get.height / 134.4),
        oneTextFieldContainer(controller, controller.milkController, false,
            KeyTexts.liter, TextInputAction.next),
        SizedBox(height: Get.height / 67.2),
        const Text(MenuTexts.totalGreengroceryConsumption, style: bodyStyle),
        SizedBox(height: Get.height / 134.4),
        oneTextFieldContainer(controller, controller.greengroceryController,
            false, KeyTexts.kg, TextInputAction.done),
      ],
    ),
  );
}
