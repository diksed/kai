import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Utils/app_colors.dart';
import '../../../../Utils/app_texts.dart';

showSnackBar() {
  Get.snackbar(
    WarningMessages.error,
    WarningMessages.fillAllFields,
    backgroundColor: AppColors.snackBarColor,
    boxShadows: [
      const BoxShadow(
          color: Colors.black12,
          offset: Offset(0, 3),
          blurRadius: 2,
          spreadRadius: 2)
    ],
    colorText: Colors.white,
    messageText: const Text(
      WarningMessages.fillAllFields,
      style: TextStyle(color: Colors.white),
    ),
  );
}
