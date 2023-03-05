import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kai/Screens/CalculationScreen/calculation_controller.dart';
import 'package:kai/Screens/IntroductionScreen/Widgets/introduction_pages.dart';
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
        controller.calculationPageController.nextPage(
            duration: const Duration(milliseconds: 500), curve: Curves.ease);
      }
    },
    child: SizedBox(
      child: Row(
        children: [
          whichButton == DefaultTexts.back
              ? const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child:
                      Icon(Icons.arrow_back_ios, color: Colors.white, size: 12),
                )
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
