import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kai/Utils/app_texts.dart';
import 'package:kai/Utils/emission_factors.dart';
import 'package:url_launcher/url_launcher.dart';

class RecordController extends GetxController {
  final recordBox = GetStorage();

  void addRecord({
    required double electricCo2,
    required double warmingCo2,
    required double fuelCo2,
    required double foodCo2,
    required double totalCo2,
  }) {
    final today = DateTime.now();
    final List<dynamic> pastRecords = recordBox.read(KeyTexts.recordKey) ?? [];
    final record = {
      KeyTexts.recordId: today.microsecondsSinceEpoch.toString(),
      KeyTexts.dateDay: today.day.toString().padLeft(2, '0'),
      KeyTexts.dateMonth: today.month.toString(),
      KeyTexts.dateYear: today.year.toString(),
      KeyTexts.electricCo2: electricCo2,
      KeyTexts.warmingCo2: warmingCo2,
      KeyTexts.fuelCo2: fuelCo2,
      KeyTexts.foodCo2: foodCo2,
      KeyTexts.totalCo2: totalCo2,
    };
    pastRecords.add(record);
    recordBox.write(KeyTexts.recordKey, pastRecords);
  }

  void clearRecord() {
    recordBox.remove(KeyTexts.recordKey);
  }

  /// Deletes a single past record by id, instead of only "clear everything".
  void deleteRecord(String id) {
    final records = getRecords();
    records.removeWhere((r) => r[KeyTexts.recordId] == id);
    recordBox.write(KeyTexts.recordKey, records);
  }

  /// Returns all stored records, defensively normalized so a malformed or
  /// pre-update (older app version) entry can't crash the history screen —
  /// it's skipped instead.
  List<Map<String, dynamic>> getRecords() {
    final List<dynamic> raw = recordBox.read(KeyTexts.recordKey) ?? [];
    return raw
        .whereType<Map>()
        .map((e) => Map<String, dynamic>.from(e))
        .where((e) => e.containsKey(KeyTexts.totalCo2))
        .toList();
  }

  Map<String, dynamic>? getLastRecord() {
    final records = getRecords();
    if (records.isEmpty) {
      return null;
    }
    return records.last;
  }

  dynamic resultTree() {
    final lastRecord = getLastRecord();
    if (lastRecord == null) {
      return 0;
    }
    final totalCo2 = (lastRecord[KeyTexts.totalCo2] as num?) ?? 0;
    final treeCount = totalCo2 / EmissionFactors.co2KgPerTree;
    return treeCount.toStringAsFixed(0);
  }

  launchURL() async {
    const url = KeyTexts.url;
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw '$url ${'linkNotWorking'.tr}';
    }
  }
}
