import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kai/Utils/app_texts.dart';
import 'package:url_launcher/url_launcher.dart';

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

  void clearRecord() {
    recordBox.remove(DefaultTexts.recordKey);
  }

  Map<String, dynamic>? getLastRecord() {
    final List<dynamic> pastRecords =
        recordBox.read(DefaultTexts.recordKey) ?? [];
    if (pastRecords.isEmpty) {
      return null;
    }
    return pastRecords.last;
  }

  dynamic resultTree() {
    final List<dynamic> pastRecords =
        recordBox.read(DefaultTexts.recordKey) ?? [];
    if (pastRecords.isEmpty) {
      return 0;
    }
    final lastRecord = pastRecords.last;
    final totalCo2 = lastRecord[KeyTexts.totalCo2];
    var treeCount = totalCo2 / 400;
    return treeCount.toStringAsFixed(0);
  }

  launchURL() async {
    const url = 'https://www.tema.org.tr/tek-seferlik-genel-bagis';
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw '$url link çalıştırılamadı.';
    }
  }
}
