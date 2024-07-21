import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kai/Screens/CalculationScreen/calculation_controller.dart';
import 'package:kai/Screens/IntroductionScreen/Widgets/introduction_pages.dart';

class NotUsingVehicleCheckbox extends StatelessWidget {
  const NotUsingVehicleCheckbox({super.key, required this.controller});

  final CalculationController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('notUsingVehicle'.tr, style: bodyStyle),
        Obx(
          () => Checkbox(
            value: controller.isVehicleUsed.value,
            onChanged: (value) {
              controller.isVehicleUsed.value = value!;
              if (value == true) {
                controller.vehicleUseController.clear();
                controller.indicatorIndex.value = 3 * (Get.width ~/ 7.2);
              } else {
                controller.onTextChange(controller.vehicleUseController.text);
              }
            },
            activeColor: Colors.white,
            checkColor: Colors.black,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
          ),
        ),
      ],
    );
  }
}
