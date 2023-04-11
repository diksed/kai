import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FirestoreController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  var electricTl = 0.0.obs;
  var dogalgazTl = 0.0.obs;
  var fueloilTl = 0.0.obs;
  var komurTl = 0.0.obs;
  var benzinTl = 0.0.obs;
  var dizelTl = 0.0.obs;
  var aracLpgTl = 0.0.obs;

  getSpecificData(String specific) async {
    if (specific == "elektrik") {
      await firestore.collection("data").doc("elektrik").get().then((value) {
        electricTl.value = value.data()!["elektrik"];
      });
    } else if (specific == "dogalgaz") {
      await firestore.collection("data").doc("isinma").get().then((value) {
        dogalgazTl.value = value.data()!["dogalgaz"];
      });
    } else if (specific == "fuelloil") {
      await firestore.collection("data").doc("isinma").get().then((value) {
        fueloilTl.value = value.data()!["fuelloil"];
      });
    } else if (specific == "komur") {
      await firestore.collection("data").doc("isinma").get().then((value) {
        komurTl.value = value.data()!["komur"];
      });
    } else if (specific == "benzin") {
      await firestore.collection("data").doc("yakit").get().then((value) {
        benzinTl.value = value.data()!["benzin"];
      });
    } else if (specific == "dizel") {
      await firestore.collection("data").doc("yakit").get().then((value) {
        dizelTl.value = value.data()!["dizel"];
      });
    } else if (specific == "aracLpg") {
      await firestore.collection("data").doc("yakit").get().then((value) {
        aracLpgTl.value = value.data()!["lpg"];
      });
    }
  }

  @override
  void onInit() {
    getSpecificData("elektrik");

    super.onInit();
  }
}
