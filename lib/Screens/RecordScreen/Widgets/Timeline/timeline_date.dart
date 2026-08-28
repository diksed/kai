import 'package:flutter/material.dart';
import 'package:kai/main.dart';

import '../../../../Utils/app_colors.dart';
import '../../../../Utils/app_texts.dart';

/// Compact date badge for a record card: day number large, three-letter
/// month underneath, on a solid rounded background.
Widget recordDateBlock(Map<String, dynamic> record) {
  final day = (record[KeyTexts.dateDay] ?? '').toString();
  final monthIndex = int.tryParse((record[KeyTexts.dateMonth] ?? '').toString());
  final monthLabel =
      (monthIndex != null && monthIndex >= 1 && monthIndex <= 12)
          ? months[monthIndex - 1][languageCode]!
              .substring(0, 3)
              .toUpperCase()
          : '';

  return Container(
    width: 56,
    padding: const EdgeInsets.symmetric(vertical: 10),
    decoration: BoxDecoration(
      color: AppColors.indicatorBackground,
      borderRadius: BorderRadius.circular(14),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          day,
          style: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
        if (monthLabel.isNotEmpty)
          Text(
            monthLabel,
            style: const TextStyle(
                color: Colors.white70,
                fontSize: 11,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.4),
          ),
      ],
    ),
  );
}
