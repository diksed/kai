import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kai/Utils/app_texts.dart';

class RecordController extends GetxController {
  final recordBox = GetStorage();

  void addRecord(double co2Total) {
    final today = DateTime.now();
    final List<dynamic> pastRecords =
        recordBox.read(DefaultTexts.recordKey) ?? [];
    if (today.day < 10) {
      final record = {
        KeyTexts.dateDay: "0${today.day}",
        KeyTexts.dateMonth: '${today.month}',
        KeyTexts.totalCo2: co2Total,
      };
      pastRecords.add(record);
    } else {
      final record = {
        KeyTexts.dateDay: "${today.day}",
        KeyTexts.dateMonth: '${today.month}',
        KeyTexts.totalCo2: co2Total,
      };
      pastRecords.add(record);
    }

    recordBox.write(DefaultTexts.recordKey, pastRecords);
  }
}
