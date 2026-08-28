import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kai/Screens/CalculationScreen/Widgets/Electric/one_text_field_container.dart';
import 'package:kai/Screens/RecordScreen/record_controller.dart';
import '../../../IntroductionScreen/Widgets/introduction_pages.dart';
import '../../calculation_controller.dart';
import '../../result_controller.dart';
import '../Common/next_back_button.dart';

Widget foodInputSizedBox(CalculationController controller,
    ResultController resultController, RecordController recordController) {
  return SizedBox(
    height: Get.height / 2.24,
    width: Get.width / 1.058,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text('menuTotalMeatConsumption'.tr, style: bodyStyle),
        SizedBox(height: Get.height / 134.4),
        oneTextFieldContainer(
            controller,
            controller.meatController,
            false,
            'kg'.tr,
            TextInputAction.next,
            Get.height / 11.2,
            Get.width / 1.714,
            Get.height / 33.6),
        SizedBox(height: Get.height / 67.2),
        Text('menuTotalMilkConsumption'.tr, style: bodyStyle),
        SizedBox(height: Get.height / 134.4),
        oneTextFieldContainer(
            controller,
            controller.milkController,
            false,
            'liter'.tr,
            TextInputAction.next,
            Get.height / 11.2,
            Get.width / 1.714,
            Get.height / 33.6),
        SizedBox(height: Get.height / 67.2),
        Text('menuTotalGreengroceryConsumption'.tr, style: bodyStyle),
        SizedBox(height: Get.height / 134.4),
        oneTextFieldContainer(
            controller,
            controller.greengroceryController,
            false,
            'kg'.tr,
            TextInputAction.next,
            Get.height / 11.2,
            Get.width / 1.714,
            Get.height / 33.6,
            // Last field on this screen — its keyboard key does what tapping
            // "İleri" does (see onSubmitted wiring in text_field.dart for
            // why this is also .next rather than .done). The two fields
            // above it keep Flutter's default `.next` behavior (just moves
            // focus onward) since no onSubmitted is passed for them.
            onSubmitted: () =>
                advanceCalculation(controller, resultController, recordController)),
      ],
    ),
  );
}
