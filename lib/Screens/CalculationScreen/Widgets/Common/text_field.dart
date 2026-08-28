import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../calculation_controller.dart';

Widget customTextField(
    CalculationController controller,
    TextEditingController textEditingController,
    double sizedBoxWidth,
    int maxLength,
    TextInputAction textInputAction,
    double sizedBoxHeight,
    bool isVehicleUsed,
    {VoidCallback? onSubmitted}) {
  return SizedBox(
    height: sizedBoxHeight,
    width: sizedBoxWidth,
    child: Column(
      children: [
        SizedBox(height: Get.height / 96),
        TextField(
          enabled: isVehicleUsed,
          textInputAction: textInputAction,
          controller: textEditingController,
          onChanged: controller.onTextChange,
          // Wires the keyboard's own action key to the same thing tapping
          // the on-screen "İleri" button does. Only passed for a screen's
          // last field, which is also given textInputAction: .next so the
          // key itself reads "Next" instead of "Done" — it does advance the
          // whole flow, just to the next *screen* rather than the next
          // field, so the default .next behavior (move focus to the next
          // field) is swapped for a plain unfocus instead.
          onSubmitted: onSubmitted == null ? null : (_) => onSubmitted(),
          onEditingComplete: onSubmitted == null
              ? null
              : () => FocusManager.instance.primaryFocus?.unfocus(),
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

TextStyle textFieldTextStyle() {
  return const TextStyle(color: Colors.white, fontSize: 25);
}
