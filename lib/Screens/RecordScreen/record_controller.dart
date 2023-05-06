import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kai/Utils/app_texts.dart';

class RecordController extends GetxController {
  final recordBox = GetStorage();

  void addRecord(double co2Total) {
    final today = DateTime.now();
    final record = {
      'date': "${today.day}/${today.month}/${today.year}",
      'totalCo2': co2Total,
    };

    final List<dynamic> pastRecords =
        recordBox.read(DefaultTexts.recordKey) ?? [];
    pastRecords.add(record);
    recordBox.write(DefaultTexts.recordKey, pastRecords);
  }
}
