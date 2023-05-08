import 'package:flutter/material.dart';
import 'package:kai/Utils/app_colors.dart';
import 'package:kai/Utils/app_texts.dart';

Widget co2Text(int index, List<dynamic> pastRecords) {
  return SizedBox(
    height: 60,
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(ImagesPath.co2Icon,
              height: 25,
              color: pastRecords[index]['totalCo2'] > 5500
                  ? Colors.white
                  : AppColors.backgroundColor),
          const SizedBox(width: 10),
          Text(
            '${(pastRecords[index]['totalCo2'] / 1000).toString().substring(0, 4)} Ton',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: pastRecords[index]['totalCo2'] > 5500
                    ? Colors.white
                    : AppColors.backgroundColor),
          ),
          pastRecords[index]['totalCo2'] > 5500
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
    height: 60,
    child: Row(
      children: const [
        Icon(Icons.warning_amber_rounded, color: Colors.white),
        SizedBox(
          width: 100,
          child: Text(
            'Ortalamanın çok üzerindesiniz. Geleceğimiz için daha dikkatli olunuz!',
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.w400,
            ),
          ),
        )
      ],
    ),
  );
}
