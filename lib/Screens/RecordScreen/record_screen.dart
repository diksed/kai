import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kai/Screens/RecordScreen/record_controller.dart';
import 'package:kai/Utils/app_texts.dart';

class RecordsPage extends StatelessWidget {
  RecordsPage({super.key});
  final RecordController recordController = Get.put(RecordController());

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();

    final List<dynamic> pastRecords = box.read(DefaultTexts.recordKey) ?? [];
    for (final record in pastRecords) {
      final date = record['date'];
      final totalCo2 = record['totalCo2'];
      final result = (totalCo2 / 1000).toStringAsFixed(2);
      print('$date: $result ton CO2');
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Geçmiş Kayıtlar'),
      ),
      body: Row(
        children: const [],
      ),
    );
  }
}
