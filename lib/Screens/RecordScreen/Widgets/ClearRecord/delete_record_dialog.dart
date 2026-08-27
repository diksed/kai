import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Utils/app_colors.dart';
import '../../record_controller.dart';

Future<dynamic> deleteRecordDialog(
    RecordController recordController, String recordId, VoidCallback onDeleted) {
  return Get.defaultDialog(
      title: 'deleteRecord'.tr,
      titleStyle: const TextStyle(color: AppColors.backgroundColor),
      middleText: 'deleteRecordText'.tr,
      middleTextStyle: const TextStyle(color: AppColors.backgroundColor),
      textConfirm: 'yes'.tr,
      textCancel: 'no'.tr,
      confirmTextColor: Colors.white,
      buttonColor: AppColors.indicatorBackground,
      cancelTextColor: AppColors.indicatorBackground,
      onConfirm: () {
        recordController.deleteRecord(recordId);
        Get.back();
        onDeleted();
      },
      onCancel: () {
        Get.back();
      });
}
