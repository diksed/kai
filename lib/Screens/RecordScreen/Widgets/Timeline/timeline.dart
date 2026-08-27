import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kai/Screens/RecordScreen/Widgets/Timeline/timeline_co2.dart';
import 'package:kai/Screens/RecordScreen/Widgets/Timeline/timeline_date.dart';

import '../../record_controller.dart';

/// A small, dependency-free vertical timeline: a dot-and-line column next to
/// a date bubble and a CO2 summary card, newest record first.
///
/// This used to be built with the `timelines` package, which was abandoned
/// upstream and stopped compiling on current Dart/Flutter (it called APIs
/// Dart removed years ago). Rebuilding it in-house also made it trivial to
/// add per-record delete, which "clear everything" didn't offer before.
///
/// [onChanged] is called after a record is deleted so the caller can rebuild
/// (GetStorage isn't reactive on its own).
Widget timelineStyle(RecordController recordController, VoidCallback onChanged) {
  final List<Map<String, dynamic>> pastRecords =
      recordController.getRecords().reversed.toList();

  if (pastRecords.isEmpty) {
    return SizedBox(
      height: Get.height / 6,
      child: Center(
        child: Text(
          'pastRecords'.tr,
          style: const TextStyle(color: Colors.white70),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  return ListView.builder(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: pastRecords.length,
    itemBuilder: (context, index) {
      final record = pastRecords[index];
      final isLast = index == pastRecords.length - 1;
      return SizedBox(
        height: 120,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  EdgeInsets.fromLTRB(0, Get.width / 10, Get.width / 36, 0),
              child: timelineDate(record),
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: Get.width / 10),
                  width: 14,
                  height: 14,
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                ),
                if (!isLast)
                  const Expanded(
                    child: VerticalDivider(color: Colors.white, thickness: 3),
                  ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(Get.width / 24),
                child: timelineCo2(record, recordController, onChanged),
              ),
            ),
          ],
        ),
      );
    },
  );
}
