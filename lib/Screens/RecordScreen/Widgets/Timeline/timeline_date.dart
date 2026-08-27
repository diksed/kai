import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kai/main.dart';

import '../../../../Utils/app_texts.dart';

Widget timelineDate(Map<String, dynamic> record) {
  final totalCo2 = (record[KeyTexts.totalCo2] as num?)?.toDouble() ?? 0;
  final aboveAverage = totalCo2 > averageCo2;
  final day = (record[KeyTexts.dateDay] ?? '').toString();
  final monthIndex = int.tryParse((record[KeyTexts.dateMonth] ?? '').toString());

  return Column(
    children: [
      Container(
        width: Get.width / 9,
        height: Get.height / 16.8,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
              color: aboveAverage ? Colors.red : Colors.white,
              width: Get.width / 180),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            day.length >= 2 ? day.substring(0, 2) : day,
            style: TextStyle(
                color: aboveAverage ? Colors.red : Colors.white, fontSize: 17),
          ),
        ),
      ),
      if (monthIndex != null && monthIndex >= 1 && monthIndex <= 12)
        Text(
          months[monthIndex - 1][languageCode]!,
          style: TextStyle(
              color: aboveAverage ? Colors.red : Colors.white, fontSize: 15),
        ),
    ],
  );
}
