import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kai/Utils/app_colors.dart';
import 'package:kai/Utils/app_texts.dart';
import '../introduction_controller.dart';

Widget nextButton(
    bool onLastPage, IntroductionController controller, GetStorage box) {
  return SizedBox(
    height: onLastPage ? Get.height / 13.44 : Get.height / 16.8,
    width: onLastPage ? Get.width / 1.8 : Get.width / 3.6,
    child: ElevatedButton(
      onPressed: () async {
        onLastPage
            ? {
                await box.write('isIntroShown', true),
                Get.toNamed(RoutesTexts.menu)
              }
            : controller.currentIndex.value++;
        controller.pageController.nextPage(
            duration: const Duration(milliseconds: 500), curve: Curves.ease);
      },
      style: buttonStyle(),
      child: Text(
        onLastPage ? 'letsBegin'.tr : 'next'.tr,
        style: buttonTextStyle(),
      ),
    ),
  );
}

ButtonStyle buttonStyle() {
  return ElevatedButton.styleFrom(
    enableFeedback: false,
    foregroundColor: Colors.white,
    backgroundColor: AppColors.dotColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
}

TextStyle buttonTextStyle() {
  return const TextStyle(fontSize: 21, fontWeight: FontWeight.w500);
}
