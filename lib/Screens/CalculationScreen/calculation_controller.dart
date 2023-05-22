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
  var vehicleUseType = KeyTexts.gasoline.obs;
  var vehicleUseUnit = KeyTexts.liter.obs;
  var warmingfuelType = KeyTexts.naturalGas.obs;
  var warmingfuelUnit = KeyTexts.m3.obs;
  final List<String> vehicleFuelTypes = [
    KeyTexts.gasoline,
    KeyTexts.diesel,
    KeyTexts.lpg
  ];
  final Map<String, List<String>> vehicleFuelUnits = {
    KeyTexts.gasoline: [KeyTexts.liter, KeyTexts.tl],
    KeyTexts.diesel: [KeyTexts.liter, KeyTexts.tl],
    KeyTexts.lpg: [KeyTexts.liter, KeyTexts.tl],
  };
  final List<String> warmingFuelTypes = [
    KeyTexts.naturalGas,
    KeyTexts.fuelOil,
    KeyTexts.coal
  ];
  final Map<String, List<String>> warmingFuelUnits = {
    KeyTexts.naturalGas: [KeyTexts.m3, KeyTexts.tl],
    KeyTexts.fuelOil: [KeyTexts.liter, KeyTexts.tl],
    KeyTexts.coal: [KeyTexts.kg, KeyTexts.tl],
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
