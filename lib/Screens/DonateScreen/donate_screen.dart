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
            const Center(
              child:
                  Text(DefaultTexts.donateSapling, style: notWhiteTitleStyle),
            ),
            Center(
              child: SizedBox(
                width: Get.width / 1.2,
                child: Text.rich(
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                  TextSpan(
                    text: DefaultTexts.lastAction,
                    children: [
                      TextSpan(
                        text: '${recordController.resultTree()}',
                        style: const TextStyle(color: Colors.red),
                      ),
                      const TextSpan(text: DefaultTexts.withDonateSapling),
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
                      buttonText: DefaultTexts.giveUp,
                      onPressed: () {
                        Get.back();
                      }),
                  BottomSheetButton(
                      onPressed: () => recordController.launchURL(),
                      buttonText: DefaultTexts.donate,
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
