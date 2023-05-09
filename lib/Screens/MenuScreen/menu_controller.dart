import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../Utils/app_texts.dart';

class MenuPageController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  var infoMessage = WarningMessages.loading.obs;

  Future<void> getRandomInfoMessage() async {
    try {
      final DocumentReference docRef =
          firestore.collection(KeyTexts.info).doc(KeyTexts.infoMessages);
      final docSnapshot = await docRef.get();
      final data = docSnapshot.data() as Map<String, dynamic>;
      final fields = data.values.toList();
      final randomIndex = Random().nextInt(fields.length);
      infoMessage.value = fields[randomIndex];
    } catch (e) {
      infoMessage.value = WarningMessages.anErrorOccurred;
    }
  }

  @override
  void onInit() {
    getRandomInfoMessage();
    super.onInit();
  }
}
