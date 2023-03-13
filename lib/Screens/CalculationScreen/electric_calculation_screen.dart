import 'package:flutter/material.dart';
import 'package:kai/Screens/IntroductionScreen/Widgets/introduction_pages.dart';
import 'package:kai/Utils/app_colors.dart';
import 'package:kai/Utils/app_texts.dart';
import '../MenuScreen/Widgets/menu_background_image.dart';
import 'Widgets/calculation_input_container.dart';
import 'calculation_controller.dart';

Widget electricCalculationScreen(CalculationController controller) {
  return Scaffold(
    backgroundColor: AppColors.backgroundColor,
    body: Center(
      child: Stack(
        children: [
          const Align(
              alignment: Alignment.bottomCenter,
              child:
                  BackgroundImage(imagePath: ImagesPath.electricConsumption)),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 60),
                  child: SizedBox(
                    height: 130,
                    width: 310,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text(IntroductionText.electricConsumption,
                            style: titleStyle),
                        Text(DescriptionTexts.electricConsumption,
                            style: bodyStyle, textAlign: TextAlign.center)
                      ],
                    ),
                  ),
                ),
                calculationInputContainer(controller),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
