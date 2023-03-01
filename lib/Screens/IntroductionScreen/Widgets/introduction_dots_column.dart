import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../Utils/app_colors.dart';
import '../introduction_controller.dart';
import 'next_button.dart';

Column buttonDotsColumn(PageController controller, bool onLastPage,
    IntroductionController introductionController) {
  return Column(
    children: [
      nextButton(onLastPage, introductionController),
      const SizedBox(height: 30),
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
