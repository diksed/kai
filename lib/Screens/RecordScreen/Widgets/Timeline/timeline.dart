import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kai/Screens/RecordScreen/Widgets/Timeline/timeline_co2.dart';
import 'package:kai/Screens/RecordScreen/Widgets/Timeline/timeline_date.dart';
import 'package:timelines/timelines.dart';
import '../../../../Utils/app_texts.dart';
import '../../record_controller.dart';

Widget timelineStyle(RecordController recordController) {
  final box = GetStorage();
  final List<dynamic> pastRecords =
      box.read(KeyTexts.recordKey)?.toList()?.reversed?.toList() ?? [];

  return FixedTimeline.tileBuilder(
    theme: TimelineThemeData(
        indicatorTheme: const IndicatorThemeData(size: 20, color: Colors.white),
        connectorTheme:
            const ConnectorThemeData(thickness: 5, color: Colors.white)),
    builder: TimelineTileBuilder.connectedFromStyle(
        contentsAlign: ContentsAlign.basic,
        oppositeContentsBuilder: (context, index) => Padding(
              padding:
                  EdgeInsets.fromLTRB(0, Get.width / 10, Get.width / 36, 0),
              child: timelineDate(index, pastRecords),
            ),
        contentsBuilder: (context, index) => Padding(
              padding: EdgeInsets.all(Get.width / 24),
              child: timelineCo2(index, pastRecords),
            ),
        nodePositionBuilder: (context, index) => 0.2,
        connectorStyleBuilder: (context, index) => ConnectorStyle.solidLine,
        indicatorStyleBuilder: (context, index) => IndicatorStyle.dot,
        itemCount: pastRecords.length,
        itemExtent: 120),
  );
}
