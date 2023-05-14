import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../calculation_controller.dart';

Widget customTextField(
    CalculationController controller,
    TextEditingController textEditingController,
    double sizedBoxWidth,
    int maxLength,
    TextInputAction textInputAction,
    double sizedBoxHeight) {
  return SizedBox(
    height: sizedBoxHeight,
    width: sizedBoxWidth,
    child: Column(
      children: [
        SizedBox(height: Get.height / 96),
        TextField(
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
          style: textFieldTextStyle(),
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
        ),
      ],
    ),
  );
}

textFieldTextStyle() {
  return const TextStyle(
    color: Colors.white,
    fontSize: 25,
  );
}
