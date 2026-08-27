import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kai/Screens/RecordScreen/Widgets/ClearRecord/delete_record_dialog.dart';
import 'package:kai/Screens/RecordScreen/Widgets/Timeline/co2_text.dart';
import 'package:kai/Utils/app_colors.dart';
import 'package:kai/Utils/app_texts.dart';

import '../../record_controller.dart';

Widget timelineCo2(Map<String, dynamic> record,
    RecordController recordController, VoidCallback onChanged) {
  final totalCo2 = (record[KeyTexts.totalCo2] as num?)?.toDouble() ?? 0;
  final aboveAverage = totalCo2 > averageCo2;
  final recordId = record[KeyTexts.recordId]?.toString();

  return Container(
    height: Get.height / 9.6,
    width: aboveAverage ? Get.width / 1.565 : Get.width / 3,
    decoration: BoxDecoration(
        color: aboveAverage ? Colors.red : Colors.white,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(15))),
    child: Stack(
      children: [
        co2Text(record),
        if (recordId != null)
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: () =>
                  deleteRecordDialog(recordController, recordId, onChanged),
              child: Icon(Icons.close,
                  size: 16,
                  color: aboveAverage
                      ? Colors.white70
                      : AppColors.backgroundColor.withValues(alpha: 0.5)),
            ),
          ),
      ],
    ),
  );
}
