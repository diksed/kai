import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kai/Screens/RecordScreen/Widgets/ClearRecord/delete_record_dialog.dart';
import 'package:kai/Screens/RecordScreen/Widgets/Timeline/timeline_date.dart';
import 'package:kai/Utils/app_colors.dart';
import 'package:kai/Utils/app_texts.dart';
import 'package:kai/Utils/number_format.dart';

import '../../record_controller.dart';

/// One past-record card: date badge, tonnes with a status icon, and a
/// delete affordance — a flat, elevated card instead of the old
/// dot-and-connector timeline row, which read as cluttered and made a
/// record's width jump around depending on its value.
Widget recordCard(Map<String, dynamic> record,
    RecordController recordController, VoidCallback onChanged) {
  final totalCo2 = (record[KeyTexts.totalCo2] as num?)?.toDouble() ?? 0;
  final aboveAverage = totalCo2 > averageCo2;
  final recordId = record[KeyTexts.recordId]?.toString();
  final statusColor = aboveAverage ? Colors.red[400]! : AppColors.backgroundColor;

  return Container(
    margin: const EdgeInsets.only(bottom: 14),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 3)),
      ],
    ),
    child: Row(
      children: [
        recordDateBlock(record),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Icon(
                      aboveAverage
                          ? Icons.warning_amber_rounded
                          : Icons.eco_outlined,
                      color: statusColor,
                      size: 18),
                  const SizedBox(width: 6),
                  Flexible(
                    child: Text(
                      '${formatCo2Value(totalCo2 / 1000, maxDecimals: 2)} ${'tonne'.tr}',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: statusColor),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              if (aboveAverage) ...[
                const SizedBox(height: 2),
                Text(
                  'aboveAverage'.tr,
                  style: TextStyle(fontSize: 11.5, color: Colors.red[300]),
                ),
              ],
            ],
          ),
        ),
        if (recordId != null)
          GestureDetector(
            onTap: () =>
                deleteRecordDialog(recordController, recordId, onChanged),
            child: const Padding(
              padding: EdgeInsets.all(4),
              child: Icon(Icons.close_rounded, size: 20, color: Colors.black26),
            ),
          ),
      ],
    ),
  );
}
