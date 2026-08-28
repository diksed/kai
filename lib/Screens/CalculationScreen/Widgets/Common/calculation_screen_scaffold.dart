import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kai/Screens/CalculationScreen/calculation_controller.dart';
import 'package:kai/Utils/app_colors.dart';
import 'package:kai/Utils/layout.dart';
import '../../../../Utils/Widgets/app_logo.dart';
import '../../../IntroductionScreen/Widgets/introduction_pages.dart';
import '../../../MenuScreen/Widgets/menu_background_image.dart';
import '../../../RecordScreen/record_controller.dart';
import '../../result_controller.dart';
import '../Indicator/animated_indicator.dart';
import 'next_back_button.dart';

Widget calculationScreen(
    String imagePath,
    double sizedBoxHeight,
    double sizedBoxWidth,
    String title,
    String description,
    Widget input,
    CalculationController calculationController,
    ResultController resultController,
    RecordController recordController) {
  return Scaffold(
    backgroundColor: AppColors.backgroundColor,
    body: ScrollConfiguration(
      behavior: const ScrollBehavior().copyWith(overscroll: false),
      child: SingleChildScrollView(
        child: Center(
          child: Stack(alignment: Alignment.bottomCenter, children: [
            Align(
                alignment: Alignment.bottomCenter,
                child: BackgroundImage(imagePath: imagePath)),
            Column(
              children: [
                appLogo(),
                Obx(
                  () => AnimatedIndicator(
                      indicatorIndex:
                          calculationController.indicatorIndex.value),
                ),
                // sizedBoxWidth used to be passed straight through as this
                // box's width — on the food/result screens that was the
                // full screen width, so the description text ran flush to
                // both edges. A fixed horizontal margin instead, applied
                // consistently across every calculation screen.
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kScreenHPadding),
                  child: SizedBox(
                    height: sizedBoxHeight,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(title, style: titleStyle),
                        Text(description,
                            style: bodyStyle, textAlign: TextAlign.center)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: Get.height / 33.6),
                input,
                SizedBox(height: Get.height / 9.6),
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      backNextButton(
                          calculationController,
                          calculationController.onLastPage.value,
                          'back'.tr,
                          resultController,
                          recordController),
                      Obx(
                        () => backNextButton(
                            calculationController,
                            calculationController.onLastPage.value,
                            'next'.tr,
                            resultController,
                            recordController),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    ),
  );
}
