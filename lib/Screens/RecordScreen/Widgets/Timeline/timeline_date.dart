import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Utils/app_texts.dart';

Widget timelineDate(int index, List<dynamic> pastRecords) {
  return Column(
    children: [
      Container(
        width: Get.width / 9,
        height: Get.height / 16.8,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
              color: pastRecords[index][KeyTexts.totalCo2] > 5500
                  ? Colors.red
                  : Colors.white,
              width: Get.width / 180),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            pastRecords[index][KeyTexts.dateDay].toString().substring(0, 2),
            style: TextStyle(
                color: pastRecords[index][KeyTexts.totalCo2] > 5500
                    ? Colors.red
                    : Colors.white,
                fontSize: 17),
          ),
        ),
      ),
      Text(
        months[int.parse(pastRecords[index][KeyTexts.dateMonth]) - 1][0],
        style: TextStyle(
            color: pastRecords[index][KeyTexts.totalCo2] > 5500
                ? Colors.red
                : Colors.white,
            fontSize: 15),
      )
    ],
  );
}
