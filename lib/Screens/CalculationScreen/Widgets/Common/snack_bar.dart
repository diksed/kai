import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Utils/app_colors.dart';

showSnackBar(
    {String title = 'error',
    String message = 'fillAllFields',
    SnackPosition position = SnackPosition.TOP}) {
  Get.snackbar(
    title.tr,
    message.tr,
    duration: const Duration(seconds: 2),
    margin: const EdgeInsets.all(8),
    snackPosition: position,
    backgroundColor: AppColors.snackBarColor,
    boxShadows: [
      const BoxShadow(
          color: Colors.black12,
          offset: Offset(0, 3),
          blurRadius: 2,
          spreadRadius: 2)
    ],
    colorText: Colors.white,
    messageText: Text(
      message.tr,
      style: const TextStyle(color: Colors.white),
    ),
  );
}
