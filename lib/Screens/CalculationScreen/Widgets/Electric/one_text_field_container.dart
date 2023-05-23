import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kai/Screens/IntroductionScreen/Widgets/introduction_pages.dart';

import '../../../../Utils/app_colors.dart';
import '../../calculation_controller.dart';
import '../Common/inner_shadow_effect.dart';
import '../Common/text_field.dart';
import 'electric_dropdown_menu.dart';

Container oneTextFieldContainer(
    CalculationController controller,
    TextEditingController textEditingController,
    bool whichOne,
    String unit,
    TextInputAction textInputAction,
    double height,
    double width,
    double padding,
    {bool isVehicleUsed = true}) {
  return Container(
      height: height,
      width: width,
      decoration: innerShadowEffect(AppColors.inputBackground),
      child: SizedBox(
          height: height,
          width: width,
          child: Row(
            children: [
              customTextField(controller, textEditingController,
                  Get.width / 2.117, 9, textInputAction, height, isVehicleUsed),
              if (whichOne)
                ElectricDropdownMenu(
                    electricSelectedType: controller.electricSelectedType)
              else
                Text(unit, style: bodyStyle)
            ],
          )));
}
