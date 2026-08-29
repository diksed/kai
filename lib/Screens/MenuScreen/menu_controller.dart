import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kai/Screens/CalculationScreen/Widgets/Common/snack_bar.dart';
import 'package:kai/main.dart';
import '../../Utils/carbon_facts.dart';
import '../../Utils/consent_manager.dart';

class MenuPageController extends GetxController {
  var infoMessage = ''.obs;
  // Only shown once the UMP SDK confirms this user actually needs a way to
  // revisit their consent choice (e.g. EEA/UK, or some US states).
  var showPrivacyOptions = false.obs;
  DateTime? _lastPressedAt;

  void getRandomInfoMessage() {
    final facts = languageCode == 'tr' ? CarbonFacts.tr : CarbonFacts.en;
    infoMessage.value = facts[Random().nextInt(facts.length)];
  }

  void onBackPressed(BuildContext context) {
    if (_lastPressedAt == null ||
        DateTime.now().difference(_lastPressedAt!) >
            const Duration(seconds: 2)) {
      _lastPressedAt = DateTime.now();
      showSnackBar(
          title: 'exitApp',
          message: 'pressAgainToExit',
          position: SnackPosition.BOTTOM);
      return;
    }
    SystemNavigator.pop();
  }

  @override
  void onInit() {
    getRandomInfoMessage();
    ConsentManager.instance
        .isPrivacyOptionsRequired()
        .then((required) => showPrivacyOptions.value = required);
    super.onInit();
  }
}
