import 'package:flutter/material.dart';

import '../../../../Utils/app_texts.dart';

Widget timelineDate(String dateDay, String dateMonth) {
  return Column(
    children: [
      Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Colors.white, width: 2),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            dateDay.substring(0, 2),
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
      Text(
        months[int.parse(dateMonth) - 1][0],
        style: const TextStyle(color: Colors.white),
      )
    ],
  );
}
