import 'package:flutter/material.dart';

import '../../calculation_controller.dart';

Widget customTextField(
    CalculationController controller,
    TextEditingController textEditingController,
    double sizedBoxWidth,
    int maxLength,
    TextInputAction textInputAction,
    {double sizedBoxHeight = 60}) {
  return SizedBox(
    height: sizedBoxHeight,
    width: sizedBoxWidth,
    child: Padding(
      padding: const EdgeInsets.only(top: 5),
      child: TextField(
        textInputAction: textInputAction,
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
