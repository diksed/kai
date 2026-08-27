import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kai/Utils/app_colors.dart';
import 'package:kai/Utils/app_texts.dart';

Widget co2Text(Map<String, dynamic> record) {
  final totalCo2 = (record[KeyTexts.totalCo2] as num?)?.toDouble() ?? 0;
  final aboveAverage = totalCo2 > averageCo2;
  final textColor = aboveAverage ? Colors.white : AppColors.backgroundColor;

  return SizedBox(
    height: Get.height / 11.2,
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(ImagesPath.co2Icon,
              height: Get.height / 26.88, color: textColor),
          SizedBox(width: Get.width / 36),
          // Tonnes, e.g. "1.24 t" — was previously built with a fixed
          // substring() on the raw string, which threw a RangeError for any
          // footprint under 1 tonne (a very reachable value).
          Text(
            '${(totalCo2 / 1000).toStringAsFixed(2)} ${'tonne'.tr}',
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w500, color: textColor),
          ),
          if (aboveAverage)
            const Padding(
              padding: EdgeInsets.only(left: 5),
              child: WarningMessage(),
            ),
        ],
      ),
    ),
  );
}

class WarningMessage extends StatelessWidget {
  const WarningMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height / 11.2,
      child: Row(
        children: [
          const Icon(Icons.warning_amber_rounded, color: Colors.white),
          SizedBox(
            width: Get.width / 3.6,
            child: Text(
              'aboveAverage'.tr,
              textAlign: TextAlign.start,
              style: const TextStyle(
                  color: Colors.white, fontSize: 10, fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
    );
  }
}
