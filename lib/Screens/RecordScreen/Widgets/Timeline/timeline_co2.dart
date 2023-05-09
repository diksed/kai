import 'package:flutter/material.dart';
import 'package:kai/Screens/RecordScreen/Widgets/Timeline/co2_text.dart';
import 'package:kai/Utils/app_texts.dart';

Widget timelineCo2(int index, List<dynamic> pastRecords) {
  return Container(
    height: 70,
    width: pastRecords[index][KeyTexts.totalCo2] > 5500 ? 230 : 120,
    decoration: BoxDecoration(
        color: pastRecords[index][KeyTexts.totalCo2] > 5500
            ? Colors.red
            : Colors.white,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(15))),
    child: co2Text(index, pastRecords),
  );
}
