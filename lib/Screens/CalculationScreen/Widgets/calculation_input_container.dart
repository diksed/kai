import 'package:flutter/material.dart';
import 'package:kai/Screens/CalculationScreen/Widgets/dropdown_menu.dart';
import 'package:kai/Screens/IntroductionScreen/Widgets/introduction_pages.dart';
import 'package:kai/Utils/app_colors.dart';
import 'package:kai/Utils/app_texts.dart';
import '../calculation_controller.dart';
import 'inner_shadow_effect.dart';

Widget calculationInputContainer(CalculationController controller) {
  return SizedBox(
    height: 115,
    width: 310,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(MenuTexts.totalConsumption, style: titleStyle),
        textFieldContainer(controller),
      ],
    ),
  );
}

Container textFieldContainer(CalculationController controller) {
  return Container(
      height: 60,
      width: 250,
      decoration: innerShadowEffect(AppColors.inputBackground),
      child: SizedBox(
          height: 60,
          width: 250,
          child: Row(
            children: [
              customTextField(controller),
              CustomDropdownMenu(
                  electricSelectedType: controller.electricSelectedType)
            ],
          )));
}

Widget customTextField(CalculationController controller) {
  return SizedBox(
    height: 60,
    width: 170,
    child: Padding(
      padding: const EdgeInsets.only(top: 5),
      child: TextField(
        controller: controller.electricController,
        onChanged: controller.onTextChange,
        maxLength: 9,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: '0',
            counterText: '',
            hintStyle: textFieldTextStyle()),
        cursorColor: Colors.white,
        style: textFieldTextStyle(fontSize: 25),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
      ),
    ),
  );
}

textFieldTextStyle({double fontSize = 30}) {
  return const TextStyle(
    color: Colors.white,
    fontSize: 25,
  );
}
