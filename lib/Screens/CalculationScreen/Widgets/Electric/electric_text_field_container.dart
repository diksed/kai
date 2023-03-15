import 'package:flutter/material.dart';

import '../../../../Utils/app_colors.dart';
import '../../calculation_controller.dart';
import '../Common/inner_shadow_effect.dart';
import '../Common/text_field.dart';
import 'electric_dropdown_menu.dart';

Container electricTextFieldContainer(CalculationController controller) {
  return Container(
      height: 60,
      width: 250,
      decoration: innerShadowEffect(AppColors.inputBackground),
      child: SizedBox(
          height: 60,
          width: 250,
          child: Row(
            children: [
              customTextField(
                  controller, controller.electricController, 170, 9),
              ElectricDropdownMenu(
                  electricSelectedType: controller.electricSelectedType)
            ],
          )));
}
