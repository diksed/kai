import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Utils/app_colors.dart';
import '../../../../Utils/app_texts.dart';
import '../../../IntroductionScreen/Widgets/introduction_pages.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({
    super.key,
    required this.whichButton,
    required this.onLastPage,
  });
  final String whichButton;
  final bool onLastPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 16.8,
      width: Get.width / 5.142,
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
    );
  }
}
