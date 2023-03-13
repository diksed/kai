import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kai/Screens/CalculationScreen/CalculationScreens/calculation_input_container.dart';
import 'package:kai/Screens/CalculationScreen/Widgets/warming_dropdown_menu.dart';
import 'package:kai/Screens/CalculationScreen/calculation_controller.dart';

import '../../../Utils/app_colors.dart';
import '../../../Utils/app_texts.dart';
import '../../IntroductionScreen/Widgets/introduction_pages.dart';
import '../Widgets/inner_shadow_effect.dart';

Widget warmingInput(CalculationController controller) {
  return SizedBox(
    height: 115,
    width: 310,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(MenuTexts.totalConsumption, style: titleStyle),
        _textFieldContainer(controller),
      ],
    ),
  );
}

Row _textFieldContainer(CalculationController controller) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
          height: 60,
          width: 230,
          decoration: innerShadowEffect(AppColors.inputBackground),
          child: SizedBox(
              height: 60,
              width: 210,
              child: Row(
                children: [
                  customTextField(
                      controller, controller.warmingController, 110, 6),
                  WarmingDropdownMenu(controller: controller)
                ],
              ))),
      Container(
        height: 60,
        width: 70,
        decoration: innerShadowEffect(AppColors.inputBackground),
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: warmingValueDropdownMenu(controller),
        ),
      ),
    ],
  );
}

Widget warmingValueDropdownMenu(CalculationController controller) {
  return SizedBox(
    height: 60,
    width: 50,
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
        itemHeight: 60,
        value: controller.warmingfuelUnit.value,
        onChanged: (newValue) {
          controller.warmingfuelUnit.value = newValue!;
        },
        items: controller.fuelUnits[controller.warmingfuelType.value]
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
