import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../app_texts.dart';

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
    if (specific == FirebaseConnectionTexts.electric) {
      await firestore
          .collection(FirebaseConnectionTexts.data)
          .doc(FirebaseConnectionTexts.electric)
          .get()
          .then((value) {
        electricTl.value = value.data()![FirebaseConnectionTexts.electric];
      });
    } else if (specific == FirebaseConnectionTexts.naturalGas) {
      await firestore
          .collection(FirebaseConnectionTexts.data)
          .doc(FirebaseConnectionTexts.warming)
          .get()
          .then((value) {
        dogalgazTl.value = value.data()![FirebaseConnectionTexts.naturalGas];
      });
    } else if (specific == FirebaseConnectionTexts.fuelOil) {
      await firestore
          .collection(FirebaseConnectionTexts.data)
          .doc(FirebaseConnectionTexts.warming)
          .get()
          .then((value) {
        fueloilTl.value = value.data()![FirebaseConnectionTexts.fuelOil];
      });
    } else if (specific == FirebaseConnectionTexts.coal) {
      await firestore
          .collection(FirebaseConnectionTexts.data)
          .doc(FirebaseConnectionTexts.warming)
          .get()
          .then((value) {
        komurTl.value = value.data()![FirebaseConnectionTexts.coal];
      });
    } else if (specific == FirebaseConnectionTexts.gasoline) {
      await firestore
          .collection(FirebaseConnectionTexts.data)
          .doc(FirebaseConnectionTexts.fuel)
          .get()
          .then((value) {
        benzinTl.value = value.data()![FirebaseConnectionTexts.gasoline];
      });
    } else if (specific == FirebaseConnectionTexts.diesel) {
      await firestore
          .collection(FirebaseConnectionTexts.data)
          .doc(FirebaseConnectionTexts.fuel)
          .get()
          .then((value) {
        dizelTl.value = value.data()![FirebaseConnectionTexts.diesel];
      });
    } else if (specific == FirebaseConnectionTexts.vehicleLpg) {
      await firestore
          .collection(FirebaseConnectionTexts.data)
          .doc(FirebaseConnectionTexts.fuel)
          .get()
          .then((value) {
        aracLpgTl.value = value.data()![FirebaseConnectionTexts.lpg];
      });
    }
  }

  @override
  void onInit() {
    getSpecificData(FirebaseConnectionTexts.electric);
    getSpecificData(FirebaseConnectionTexts.naturalGas);
    getSpecificData(FirebaseConnectionTexts.fuelOil);
    getSpecificData(FirebaseConnectionTexts.coal);
    getSpecificData(FirebaseConnectionTexts.gasoline);
    getSpecificData(FirebaseConnectionTexts.diesel);
    getSpecificData(FirebaseConnectionTexts.vehicleLpg);
    super.onInit();
  }
}
