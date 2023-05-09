import 'package:flutter/material.dart';
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
    height: 145,
    width: 310,
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
    height: 60,
    width: 310,
    child: Row(
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
                    customTextField(controller, textEditController, 110, 6,
                        TextInputAction.done),
                    dropdownMenu
                  ],
                ))),
        Container(
          height: 60,
          width: 70,
          decoration: innerShadowEffect(AppColors.inputBackground),
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: valueDropdownMenu,
          ),
        ),
      ],
    ),
  );
}
