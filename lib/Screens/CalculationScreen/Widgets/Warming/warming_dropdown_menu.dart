import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kai/Screens/CalculationScreen/calculation_controller.dart';
import 'package:kai/Utils/app_texts.dart';

import '../../../../Utils/app_colors.dart';

class WarmingDropdownMenu extends StatelessWidget {
  const WarmingDropdownMenu({super.key, required this.controller});
  final CalculationController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height / 11.2,
      width: Get.width / 3.130,
      child: Obx(
        () => DropdownButton(
          icon: const Icon(Icons.keyboard_arrow_down_sharp,
              color: Colors.white, size: 20),
          iconSize: 30,
          elevation: 20,
          style: const TextStyle(color: Colors.white, fontSize: 20),
          underline: Container(height: 0),
          dropdownColor: AppColors.indicatorBackground,
          borderRadius: BorderRadius.circular(15),
          alignment: Alignment.center,
          itemHeight: Get.height / 11.2,
          hint: Text(
            controller.warmingfuelType.value,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          value: controller.warmingfuelType.value,
          onChanged: (newValue) {
            controller.warmingfuelType.value = newValue!;
            controller.updateSelectedFuelType(newValue, KeyTexts.warming);
          },
          items: controller.warmingFuelTypes
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
