import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Utils/app_texts.dart';

class CalculationController extends GetxController {
  final PageController calculationPageController = PageController();
  final messengerKey = GlobalKey<ScaffoldMessengerState>();

  var isVisible = true.obs;
  var onLastPage = false.obs;
  var currentIndex = 0.obs;
  var indicatorIndex = 0.obs;
  var isVehicleUsed = false.obs;

  final TextEditingController meatController = TextEditingController();
  final TextEditingController milkController = TextEditingController();
  final TextEditingController greengroceryController = TextEditingController();
  final TextEditingController electricController = TextEditingController();
  final TextEditingController warmingController = TextEditingController();
  final TextEditingController vehicleUseController = TextEditingController();
  var electricSelectedType = KeyTexts.kWh.obs;
  var vehicleUseType = 'gasoline'.tr.obs;
  var vehicleUseUnit = 'liter'.tr.obs;
  var warmingfuelType = 'naturalGas'.tr.obs;
  var warmingfuelUnit = 'm3'.tr.obs;
  final List<String> vehicleFuelTypes = ['gasoline'.tr, 'diesel'.tr, 'lpg'.tr];
  // Only the physical unit is offered now — money-spent (TL) input used to
  // be converted to a quantity via a live Firestore price lookup, which made
  // the footprint calculation depend on prices staying up to date and on
  // Firebase being reachable at all. Entering the quantity directly is both
  // more accurate and works fully offline.
  final Map<String, List<String>> vehicleFuelUnits = {
    'gasoline'.tr: ['liter'.tr],
    'diesel'.tr: ['liter'.tr],
    'lpg'.tr: ['liter'.tr],
  };
  final List<String> warmingFuelTypes = [
    'naturalGas'.tr,
    'fuelOil'.tr,
    'coal'.tr
  ];
  final Map<String, List<String>> warmingFuelUnits = {
    'naturalGas'.tr: ['m3'.tr],
    'fuelOil'.tr: ['liter'.tr],
    'coal'.tr: ['kg'.tr],
  };

  void updateSelectedFuelType(String newType, String whichType) {
    if (whichType == KeyTexts.vehicleUse) {
      vehicleUseType.value = newType;
      vehicleUseUnit.value = vehicleFuelUnits[newType]![0];
      update();
    } else if (whichType == KeyTexts.warming) {
      warmingfuelType.value = newType;
      warmingfuelUnit.value = warmingFuelUnits[newType]![0];
      update();
    }
  }

  void onTextChange(String value) {
    if (currentIndex.value == 0) {
      indicatorIndex.value = value.isNotEmpty ? Get.width ~/ 7.2 : 0;
    } else if (currentIndex.value == 1) {
      indicatorIndex.value =
          value.isNotEmpty ? 2 * (Get.width ~/ 7.2) : Get.width ~/ 7.2;
    } else if (currentIndex.value == 2) {
      indicatorIndex.value =
          value.isNotEmpty ? 3 * (Get.width ~/ 7.2) : 2 * (Get.width ~/ 7.2);
    } else if (currentIndex.value == 3) {
      int baseWidth = 3 * (Get.width ~/ 7.2);
      int indicatorWidth = baseWidth;

      if (meatController.text.isNotEmpty) {
        indicatorWidth += (Get.width ~/ 7.2);
      }
      if (milkController.text.isNotEmpty) {
        indicatorWidth += (Get.width ~/ 7.2);
      }
      if (greengroceryController.text.isNotEmpty) {
        indicatorWidth += (Get.width ~/ 7.2);
      }

      if (indicatorWidth > Get.width) {
        indicatorWidth = Get.width.toInt();
      }

      indicatorIndex.value = indicatorWidth.toInt();
    }
  }
}
