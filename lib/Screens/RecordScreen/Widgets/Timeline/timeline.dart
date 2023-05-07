import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kai/Screens/RecordScreen/Widgets/Timeline/timeline_date.dart';
import 'package:timelines/timelines.dart';

import '../../../../Utils/app_texts.dart';
import '../../record_controller.dart';

Widget timelineStyle(RecordController recordController) {
  final box = GetStorage();
  final List<dynamic> pastRecords = box.read(DefaultTexts.recordKey) ?? [];

  return FixedTimeline.tileBuilder(
    theme: TimelineThemeData(
      indicatorTheme: const IndicatorThemeData(size: 20, color: Colors.white),
      connectorTheme:
          const ConnectorThemeData(thickness: 5, color: Colors.white),
    ),
    builder: TimelineTileBuilder.connectedFromStyle(
      contentsAlign: ContentsAlign.basic,
      oppositeContentsBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 8, right: 15),
        child: timelineDate((pastRecords[index]['dateDay'].toString()),
            (pastRecords[index]['dateMonth'].toString())),
      ),
      contentsBuilder: (context, index) => Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Text((pastRecords[index]['totalCo2'] / 1000).toStringAsFixed(2)),
        ),
      ),
      connectorStyleBuilder: (context, index) => ConnectorStyle.solidLine,
      indicatorStyleBuilder: (context, index) => IndicatorStyle.dot,
      itemCount:
          recordController.recordBox.read(DefaultTexts.recordKey)?.length ?? 0,
    ),
  );
}
