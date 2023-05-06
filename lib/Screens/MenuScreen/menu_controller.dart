import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class MenuPageController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  var infoMessage = "Yükeniyor...".obs;

  Future<void> getRandomInfoMessage() async {
    try {
      final DocumentReference docRef =
          firestore.collection('info').doc('infoMessages');
      final docSnapshot = await docRef.get();
      final data = docSnapshot.data() as Map<String, dynamic>;
      final fields = data.values.toList();
      final randomIndex = Random().nextInt(fields.length);
      infoMessage.value = fields[randomIndex];
    } catch (e) {
      infoMessage.value = "Bir hata oluştu.";
    }
  }

  @override
  void onInit() {
    getRandomInfoMessage();
    super.onInit();
  }
}
