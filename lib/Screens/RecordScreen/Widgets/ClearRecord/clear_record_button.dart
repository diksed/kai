import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Utils/app_colors.dart';

class ClearRecordButton extends StatelessWidget {
  const ClearRecordButton({super.key});

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
      child: const Icon(Icons.delete, color: Colors.white, size: 20),
    );
  }
}
