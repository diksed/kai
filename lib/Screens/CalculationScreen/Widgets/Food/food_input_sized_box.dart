import 'package:flutter/material.dart';
import 'package:kai/Screens/CalculationScreen/Widgets/Electric/one_text_field_container.dart';
import 'package:kai/Utils/app_texts.dart';

import '../../../IntroductionScreen/Widgets/introduction_pages.dart';
import '../../calculation_controller.dart';

Widget foodInputSizedBox(CalculationController controller) {
  return SizedBox(
    height: 260,
    width: 340,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text(MenuTexts.totalMeatConsumption, style: bodyStyle),
        const SizedBox(height: 5),
        oneTextFieldContainer(controller, controller.meatController, false,
            KeyTexts.kg, TextInputAction.next),
        const SizedBox(height: 10),
        const Text(MenuTexts.totalMilkConsumption, style: bodyStyle),
        const SizedBox(height: 5),
        oneTextFieldContainer(controller, controller.milkController, false,
            KeyTexts.liter, TextInputAction.next),
        const SizedBox(height: 10),
        const Text(MenuTexts.totalGreengroceryConsumption, style: bodyStyle),
        const SizedBox(height: 5),
        oneTextFieldContainer(controller, controller.greengroceryController,
            false, KeyTexts.kg, TextInputAction.done),
      ],
    ),
  );
}
