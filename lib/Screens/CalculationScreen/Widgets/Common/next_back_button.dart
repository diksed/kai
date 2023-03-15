import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kai/Screens/CalculationScreen/calculation_controller.dart';
import 'package:kai/Screens/IntroductionScreen/Widgets/introduction_pages.dart';
import 'package:kai/Utils/app_colors.dart';
import 'package:kai/Utils/app_texts.dart';

Widget backNextButton(
    CalculationController controller, bool onLastPage, String whichButton) {
  return GestureDetector(
    onTap: () async {
      if (whichButton == DefaultTexts.back) {
        if (controller.currentIndex.value == 0) {
          Get.back();
        } else {
          controller.currentIndex.value--;
          controller.indicatorIndex.value -= 75;
          controller.calculationPageController.previousPage(
              duration: const Duration(milliseconds: 500), curve: Curves.ease);
        }
      } else {
        onLastPage
            ? {
                Get.toNamed(RoutesTexts.menu),
                Get.delete<CalculationController>()
              }
            : controller.currentIndex.value++;
        if (controller.currentIndex.value == 4) {
          controller.indicatorIndex.value = 300;
        } else {
          controller.indicatorIndex.value += 75;
        }

        controller.calculationPageController.nextPage(
            duration: const Duration(milliseconds: 500), curve: Curves.ease);
      }
    },
    child: Container(
      height: 40,
      width: 70,
      decoration: const BoxDecoration(
          color: AppColors.indicatorBackground,
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 3),
                blurRadius: 6,
                spreadRadius: 0)
          ],
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          whichButton == DefaultTexts.back
              ? const Icon(Icons.arrow_back_ios, color: Colors.white, size: 12)
              : const SizedBox(),
          Text(onLastPage ? '' : whichButton, style: bodyStyle),
          whichButton == DefaultTexts.back
              ? const SizedBox()
              : Icon(onLastPage ? Icons.home : Icons.arrow_forward_ios,
                  color: Colors.white, size: onLastPage ? 20 : 12),
        ],
      ),
    ),
  );
}
