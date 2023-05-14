import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kai/Screens/CalculationScreen/Widgets/Common/text_field.dart';
import 'package:kai/Screens/CalculationScreen/Widgets/VehicleUse/not_using_vehicle_checkbox.dart';
import 'package:kai/Screens/CalculationScreen/calculation_controller.dart';

import '../../../../Utils/app_colors.dart';
import '../../../../Utils/app_texts.dart';
import '../../../IntroductionScreen/Widgets/introduction_pages.dart';
import 'inner_shadow_effect.dart';

Widget inputSizedBox(
    CalculationController controller, Container rowContainer, String whichOne) {
  return SizedBox(
    height: Get.height / 4.634,
    width: Get.width / 1.161,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(MenuTexts.totalConsumption, style: titleStyle),
        rowContainer,
        if (whichOne == KeyTexts.vehicleUse)
          NotUsingVehicleCheckbox(controller: controller)
        else
          const SizedBox()
      ],
    ),
  );
}

Container textFieldContainerRow(
    CalculationController controller,
    TextEditingController textEditController,
    Widget dropdownMenu,
    Widget valueDropdownMenu) {
  return Container(
    color: Colors.transparent,
    height: Get.height / 11.2,
    width: Get.width / 1.161,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            height: Get.height / 11.2,
            width: Get.width / 1.565,
            decoration: innerShadowEffect(AppColors.inputBackground),
            child: SizedBox(
                height: Get.height / 11.2,
                width: Get.width / 1.714,
                child: Row(
                  children: [
                    customTextField(
                        controller,
                        textEditController,
                        Get.width / 3.272,
                        6,
                        TextInputAction.done,
                        Get.height / 11.2),
                    dropdownMenu
                  ],
                ))),
        Container(
          height: Get.height / 11.2,
          width: Get.width / 5.142,
          decoration: innerShadowEffect(AppColors.inputBackground),
          child: Padding(
            padding: EdgeInsets.only(left: Get.width / 36),
            child: valueDropdownMenu,
          ),
        ),
      ],
    ),
  );
}
