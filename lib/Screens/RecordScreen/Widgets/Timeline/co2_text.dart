import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kai/Utils/app_colors.dart';
import 'package:kai/Utils/app_texts.dart';

Widget co2Text(int index, List<dynamic> pastRecords) {
  return SizedBox(
    height: Get.height / 11.2,
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(ImagesPath.co2Icon,
              height: Get.height / 26.88,
              color: pastRecords[index][KeyTexts.totalCo2] > averageCo2
                  ? Colors.white
                  : AppColors.backgroundColor),
          SizedBox(width: Get.width / 36),
          Text(
            '${(pastRecords[index][KeyTexts.totalCo2] / 1000).toString().substring(0, 4)} ${'tonne'.tr}',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: pastRecords[index][KeyTexts.totalCo2] > averageCo2
                    ? Colors.white
                    : AppColors.backgroundColor),
          ),
          pastRecords[index][KeyTexts.totalCo2] > averageCo2
              ? Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: warningMessage(),
                )
              : Container()
        ],
      ),
    ),
  );
}

Widget warningMessage() {
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
