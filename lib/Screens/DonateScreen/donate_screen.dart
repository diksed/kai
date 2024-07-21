import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kai/Screens/IntroductionScreen/Widgets/introduction_pages.dart';
import 'package:kai/Utils/app_colors.dart';

import '../../Utils/app_texts.dart';
import '../MenuScreen/Widgets/menu_background_image.dart';
import '../RecordScreen/record_controller.dart';
import 'Widgets/bottom_sheet_button.dart';

void donateBottomSheet() {
  final RecordController recordController = Get.put(RecordController());

  Get.bottomSheet(
    SizedBox(
      height: Get.height / 2.5,
      child: Stack(children: [
        const Align(
            alignment: Alignment.bottomCenter,
            child: BackgroundImage(imagePath: ImagesPath.menuBackground)),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Text('donateSapling'.tr, style: notWhiteTitleStyle),
            ),
            Center(
              child: SizedBox(
                width: Get.width / 1.2,
                child: Text.rich(
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                  TextSpan(
                    text: 'lastAction'.tr,
                    children: [
                      TextSpan(
                        text: '${recordController.resultTree()}',
                        style: const TextStyle(color: Colors.red),
                      ),
                      TextSpan(text: 'withDonateSapling'.tr),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: Get.height / 39.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BottomSheetButton(
                      buttonBgColor: Colors.red[400],
                      buttonText: 'giveUp'.tr,
                      onPressed: () {
                        Get.back();
                      }),
                  BottomSheetButton(
                      onPressed: () => recordController.launchURL(),
                      buttonText: 'donate'.tr,
                      buttonBgColor: AppColors.backgroundColor)
                ],
              ),
            ),
          ],
        ),
      ]),
    ),
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  );
}
