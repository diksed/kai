import 'package:flutter/material.dart';
import 'package:kai/Screens/CalculationScreen/Widgets/dropdown_menu.dart';
import 'package:kai/Screens/IntroductionScreen/Widgets/introduction_pages.dart';
import 'package:kai/Utils/app_colors.dart';
import 'package:kai/Utils/app_texts.dart';
import '../calculation_controller.dart';
import '../Widgets/inner_shadow_effect.dart';

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
              customTextField(
                  controller, controller.electricController, 170, 9),
              CustomDropdownMenu(
                  electricSelectedType: controller.electricSelectedType)
            ],
          )));
}

Widget customTextField(
    CalculationController controller,
    TextEditingController textEditingController,
    double sizedBoxWidth,
    int maxLength) {
  return SizedBox(
    height: 60,
    width: sizedBoxWidth,
    child: Padding(
      padding: const EdgeInsets.only(top: 5),
      child: TextField(
        controller: textEditingController,
        onChanged: controller.onTextChange,
        maxLength: maxLength,
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
