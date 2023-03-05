import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kai/Utils/app_colors.dart';
import 'package:kai/Utils/app_texts.dart';
import 'package:kai/Utils/get_storage.dart';
import '../introduction_controller.dart';

Widget nextButton(bool onLastPage, IntroductionController controller) {
  return SizedBox(
    height: onLastPage ? 50 : 40,
    width: onLastPage ? 200 : 100,
    child: ElevatedButton(
      onPressed: () async {
        onLastPage
            ? {
                await isShown.write(IntroductionText.isIntroShown, false),
                Get.toNamed('/menu')
              }
            : controller.currentIndex.value++;
        controller.pageController.nextPage(
            duration: const Duration(milliseconds: 500), curve: Curves.ease);
      },
      style: buttonStyle(),
      child: Text(
        onLastPage ? DefaultTexts.letsBegin : DefaultTexts.next,
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
