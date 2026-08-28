import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Utils/Widgets/app_logo.dart';
import '../../../../Utils/app_colors.dart';
import '../../../../Utils/layout.dart';
import '../../../IntroductionScreen/Widgets/introduction_pages.dart';
import '../../../MenuScreen/Widgets/menu_background_image.dart';
import '../../../RecordScreen/record_controller.dart';
import '../../calculation_controller.dart';
import '../../result_controller.dart';
import '../Common/next_back_button.dart';

Widget resultCalculationScreen(
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
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Align(
                  alignment: Alignment.bottomCenter,
                  child: BackgroundImage(imagePath: imagePath)),
              Column(
                children: [
                  appLogo(),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kScreenHPadding),
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
                  SizedBox(height: Get.height / 33.6),
                  // No "back" button here on purpose: going back into the
                  // input flow from the result screen and then forward
                  // again re-ran the food step's calculation and saved a
                  // second, duplicate history record. The result is already
                  // computed and saved by the time this screen shows —
                  // there's nothing sensible for "back" to do here.
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        backNextButton(
                            calculationController,
                            calculationController.onLastPage.value,
                            'next'.tr,
                            resultController,
                            recordController),
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
