import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kai/Screens/CalculationScreen/Widgets/Indicator/animated_indicator.dart';
import '../../../../Utils/Firebase/firestore_controller.dart';
import '../../../../Utils/Widgets/app_logo.dart';
import '../../../../Utils/app_colors.dart';
import '../../../../Utils/app_texts.dart';
import '../../../IntroductionScreen/Widgets/introduction_pages.dart';
import '../../../MenuScreen/Widgets/menu_background_image.dart';
import '../../../RecordScreen/record_controller.dart';
import '../../calculation_controller.dart';
import '../../result_controller.dart';
import '../Common/next_back_button.dart';

Widget foodCalculationScreen(
    String imagePath,
    double sizedBoxHeight,
    double sizedBoxWidth,
    String title,
    String description,
    Widget input,
    CalculationController calculationController,
    ResultController resultController,
    FirestoreController firestoreController,
    RecordController recordController) {
  return Scaffold(
    backgroundColor: AppColors.backgroundColor,
    body: ScrollConfiguration(
      behavior: const ScrollBehavior().copyWith(overscroll: false),
      child: SingleChildScrollView(
        child: Center(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Align(
                  alignment: Alignment.bottomCenter,
                  child: BackgroundImage(imagePath: imagePath)),
              Column(
                children: [
                  SizedBox(height: Get.height / 134.4),
                  appLogo(),
                  Obx(
                    () => AnimatedIndicator(
                        indicatorIndex:
                            calculationController.indicatorIndex.value),
                  ),
                  SizedBox(
                    height: sizedBoxHeight,
                    width: sizedBoxWidth,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(title, style: titleStyle),
                        Text(description,
                            style: bodyStyle, textAlign: TextAlign.center)
                      ],
                    ),
                  ),
                  SizedBox(height: Get.height / 33.6),
                  input,
                  SizedBox(height: Get.height / 33.6),
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        backNextButton(
                            calculationController,
                            calculationController.onLastPage.value,
                            DefaultTexts.back,
                            resultController,
                            firestoreController,
                            recordController),
                        Obx(
                          () => backNextButton(
                              calculationController,
                              calculationController.onLastPage.value,
                              DefaultTexts.next,
                              resultController,
                              firestoreController,
                              recordController),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Get.height / 67.2),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
