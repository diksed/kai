import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kai/Screens/IntroductionScreen/Widgets/introduction_pages.dart';
import 'package:kai/Utils/app_colors.dart';

import '../../Utils/app_texts.dart';
import '../MenuScreen/Widgets/menu_background_image.dart';
import '../MenuScreen/menu_controller.dart';
import '../RecordScreen/record_controller.dart';
import 'Widgets/bottom_sheet_button.dart';

void donateBottomSheet() {
  final RecordController recordController = Get.put(RecordController());
  final hasRecord = recordController.getLastRecord() != null;

  Get.bottomSheet(
    SizedBox(
      // A bit taller when there's no record yet — that case stacks two
      // buttons instead of one.
      height: hasRecord ? Get.height / 2.5 : Get.height / 2.05,
      child: Stack(children: [
        const Align(
            alignment: Alignment.bottomCenter,
            child: BackgroundImage(imagePath: ImagesPath.menuBackground)),
        // A single close icon replaces the old "Vazgeç" button — cramming
        // 2-3 buttons into one row either overflowed on narrow screens or
        // just looked crowded. Dismissing is a corner tap now, and the
        // remaining action(s) get full width to breathe.
        Positioned(
          top: Get.height / 100,
          right: Get.width / 60,
          child: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.close, color: Colors.black54),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
              Get.width / 12, Get.height / 24, Get.width / 12, Get.height / 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('donateSapling'.tr, style: notWhiteTitleStyle),
              hasRecord
                  ? Text.rich(
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
                    )
                  // No calculation yet — "your debt to nature is 0 trees"
                  // reads as nonsense, so this case gets its own,
                  // encouraging message instead of a fake zero.
                  : Text(
                      'noRecordDonateMessage'.tr,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 18, color: Colors.black),
                    ),
              Column(
                children: [
                  // No past calculation to base a tree count on — offer a
                  // direct way to go make one instead of just "donate blind".
                  if (!hasRecord) ...[
                    SizedBox(
                      width: double.infinity,
                      child: BottomSheetButton(
                          buttonBgColor: AppColors.indicatorBackground,
                          buttonText: 'calculateNow'.tr,
                          onPressed: () {
                            Get.back();
                            Get.toNamed(RoutesTexts.calculation);
                            Get.delete<MenuPageController>();
                          }),
                    ),
                    SizedBox(height: Get.height / 90),
                  ],
                  SizedBox(
                    width: double.infinity,
                    child: BottomSheetButton(
                        onPressed: () => recordController.launchURL(),
                        buttonText: 'donate'.tr,
                        buttonBgColor: AppColors.backgroundColor),
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    ),
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  );
}
