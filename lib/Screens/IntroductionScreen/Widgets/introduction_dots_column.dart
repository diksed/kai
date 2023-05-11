import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../Utils/app_colors.dart';
import '../introduction_controller.dart';
import 'next_button.dart';

Column buttonDotsColumn(PageController controller, bool onLastPage,
    IntroductionController introductionController, GetStorage box) {
  return Column(
    children: [
      nextButton(onLastPage, introductionController, box),
      SizedBox(height: Get.height / 22.4),
      SmoothPageIndicator(
          controller: controller,
          count: 3,
          effect: const ScaleEffect(
            dotHeight: 10,
            dotWidth: 10,
            dotColor: AppColors.dotColor,
            activeDotColor: Colors.white,
          ))
    ],
  );
}
