import 'package:flutter/material.dart';
import 'package:kai/Screens/RecordScreen/Widgets/Timeline/timeline_co2.dart';

import '../../record_controller.dart';

/// The past-records list: newest first, one elevated card per record (see
/// [recordCard]).
///
/// [onChanged] is called after a record is deleted so the caller can rebuild
/// (GetStorage isn't reactive on its own).
///
/// Assumes there's at least one record — callers show `EmptyRecordsView`
/// instead when there are none.
Widget timelineStyle(RecordController recordController, VoidCallback onChanged) {
  final List<Map<String, dynamic>> pastRecords =
      recordController.getRecords().reversed.toList();

  return ListView.builder(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: pastRecords.length,
    itemBuilder: (context, index) =>
        recordCard(pastRecords[index], recordController, onChanged),
  );
}
