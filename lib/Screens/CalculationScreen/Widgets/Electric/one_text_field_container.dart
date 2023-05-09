import 'package:flutter/material.dart';
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
    {double height = 50,
    double width = 210,
    double padding = 20}) {
  return Container(
      height: height,
      width: width,
      decoration: innerShadowEffect(AppColors.inputBackground),
      child: SizedBox(
          height: height,
          width: width,
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top: padding),
                child: customTextField(
                    controller, textEditingController, 170, 9, textInputAction,
                    sizedBoxHeight: height),
              ),
              if (whichOne)
                ElectricDropdownMenu(
                    electricSelectedType: controller.electricSelectedType)
              else
                Text(unit, style: bodyStyle)
            ],
          )));
}
