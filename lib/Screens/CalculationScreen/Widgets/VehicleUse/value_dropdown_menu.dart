import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Utils/app_colors.dart';
import '../../calculation_controller.dart';

Widget vehicleUseValueDropdownMenu(CalculationController controller) {
  return SizedBox(
    height: Get.height / 11.2,
    width: Get.width / 7.2,
    child: Obx(
      () => DropdownButton(
        icon: const Icon(Icons.keyboard_arrow_down_sharp, color: Colors.white),
        iconSize: 30,
        elevation: 20,
        style: const TextStyle(color: Colors.white, fontSize: 20),
        underline: Container(height: 0),
        dropdownColor: AppColors.indicatorBackground,
        borderRadius: BorderRadius.circular(15),
        alignment: Alignment.center,
        itemHeight: Get.height / 11.2,
        value: controller.vehicleUseUnit.value,
        onChanged: (newValue) {
          controller.vehicleUseUnit.value = newValue!;
        },
        items: controller.vehicleFuelUnits[controller.vehicleUseType.value]
            ?.map((value) {
          return DropdownMenuItem(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    ),
  );
}
