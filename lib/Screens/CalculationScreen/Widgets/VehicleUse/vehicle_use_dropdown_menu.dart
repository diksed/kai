import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Utils/app_colors.dart';
import '../../calculation_controller.dart';

class VehicleUseDropdownMenu extends StatelessWidget {
  const VehicleUseDropdownMenu({super.key, required this.controller});
  final CalculationController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 115,
      child: Obx(
        () => DropdownButton(
          icon:
              const Icon(Icons.keyboard_arrow_down_sharp, color: Colors.white),
          iconSize: 30,
          elevation: 20,
          style: const TextStyle(color: Colors.white, fontSize: 20),
          underline: Container(height: 0),
          dropdownColor: AppColors.indicatorBackground,
          borderRadius: BorderRadius.circular(15),
          alignment: Alignment.center,
          itemHeight: 60,
          hint: Text(
            controller.vehicleUseType.value,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          value: controller.vehicleUseType.value,
          onChanged: (newValue) {
            controller.vehicleUseType.value = newValue!;
            controller.updateSelectedFuelType(newValue, 'vehicleUse');
          },
          items: controller.carFuelTypes
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
