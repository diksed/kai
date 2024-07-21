import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kai/Screens/CalculationScreen/Widgets/Common/snack_bar.dart';
import 'package:kai/main.dart';
import '../../Utils/app_texts.dart';

class MenuPageController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  var infoMessage = 'loading'.tr.obs;
  DateTime? _lastPressedAt;

  Future<void> getRandomInfoMessage() async {
    try {
      final DocumentReference docRef = firestore.collection(KeyTexts.info).doc(
          languageCode == 'tr'
              ? KeyTexts.infoMessages
              : KeyTexts.infoMessagesEn);
      final docSnapshot = await docRef.get();
      final data = docSnapshot.data() as Map<String, dynamic>;
      final fields = data.values.toList();
      final randomIndex = Random().nextInt(fields.length);
      infoMessage.value = fields[randomIndex];
    } catch (e) {
      infoMessage.value = 'anErrorOccurred'.tr;
    }
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
    super.onInit();
  }
}
