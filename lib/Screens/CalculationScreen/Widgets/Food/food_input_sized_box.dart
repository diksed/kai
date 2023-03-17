import 'package:flutter/material.dart';
import 'package:kai/Screens/CalculationScreen/Widgets/Electric/one_text_field_container.dart';

import '../../../IntroductionScreen/Widgets/introduction_pages.dart';
import '../../calculation_controller.dart';

Widget foodInputSizedBox(CalculationController controller) {
  return SizedBox(
    height: 260,
    width: 340,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text('Yıllık Toplam Et Tüketimi', style: bodyStyle),
        const SizedBox(height: 5),
        oneTextFieldContainer(
          controller,
          controller.meatController,
          false,
          'Kg',
        ),
        const SizedBox(height: 10),
        const Text('Yıllık Toplam Süt Tüketimi', style: bodyStyle),
        const SizedBox(height: 5),
        oneTextFieldContainer(
          controller,
          controller.milkController,
          false,
          'Lt',
        ),
        const SizedBox(height: 10),
        const Text('Yıllık Toplam Sebze & Meyve Tüketimi', style: bodyStyle),
        const SizedBox(height: 5),
        oneTextFieldContainer(
          controller,
          controller.greengroceryController,
          false,
          'Kg',
        ),
      ],
    ),
  );
}
