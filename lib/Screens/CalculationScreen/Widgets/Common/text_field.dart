import 'package:flutter/material.dart';

import '../../calculation_controller.dart';

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
