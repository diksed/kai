import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kai/Screens/RecordScreen/record_controller.dart';

import '../../../../Utils/app_colors.dart';
import '../../../../Utils/app_texts.dart';

Future<dynamic> clearRecordDialog(RecordController recordController) {
  return Get.defaultDialog(
      title: DefaultTexts.clearRecord,
      titleStyle: const TextStyle(color: AppColors.backgroundColor),
      middleText: DefaultTexts.clearRecordText,
      middleTextStyle: const TextStyle(color: AppColors.backgroundColor),
      textConfirm: DefaultTexts.yes,
      textCancel: DefaultTexts.no,
      confirmTextColor: Colors.white,
      buttonColor: AppColors.indicatorBackground,
      cancelTextColor: AppColors.indicatorBackground,
      onConfirm: () {
        recordController.clearRecord();
        Get.offAndToNamed(RoutesTexts.menu);
      },
      onCancel: () {
        Get.back();
      });
}
