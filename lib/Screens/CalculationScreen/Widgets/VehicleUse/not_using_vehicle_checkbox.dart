import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kai/Screens/CalculationScreen/calculation_controller.dart';
import 'package:kai/Screens/IntroductionScreen/Widgets/introduction_pages.dart';

class NotUsingVehicleCheckbox extends StatelessWidget {
  const NotUsingVehicleCheckbox({Key? key, required this.controller})
      : super(key: key);

  final CalculationController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Bireysel Araç kullanmıyorum', style: bodyStyle),
        Obx(
          () => Checkbox(
            value: controller.isVehicleUsed.value,
            onChanged: (value) {
              controller.isVehicleUsed.value = value!;
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
