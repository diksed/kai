import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculationController extends GetxController {
  final PageController calculationPageController = PageController();
  var isVisible = true.obs;
  var onLastPage = false.obs;
  var currentIndex = 0.obs;
  var indicatorIndex = 0.obs;
  var isVehicleUsed = false.obs;

  final TextEditingController electricController = TextEditingController();
  final TextEditingController warmingController = TextEditingController();
  final TextEditingController vehicleUseController = TextEditingController();
  var electricSelectedType = 'kWh'.obs;
  var vehicleUseType = 'Benzin'.obs;
  var vehicleUseUnit = 'Lt.'.obs;
  var warmingfuelType = 'Doğalgaz'.obs;
  var warmingfuelUnit = 'm³'.obs;
  final List<String> vehicleFuelTypes = ['Benzin', 'Dizel', 'LPG'];
  final Map<String, List<String>> vehicleFuelUnits = {
    'Benzin': ['Lt.', 'TL'],
    'Dizel': ['Lt.', 'TL'],
    'LPG': ['Lt.', 'TL'],
  };
  final List<String> warmingFuelTypes = [
    'Doğalgaz',
    'LPG',
    'Fuel-Oil',
    'Kömür'
  ];
  final Map<String, List<String>> warmingFuelUnits = {
    'Doğalgaz': ['m³', 'TL'],
    'LPG': ['Lt.', 'TL'],
    'Fuel-Oil': ['Lt.', 'TL'],
    'Kömür': ['Kg', 'TL'],
  };

  void updateSelectedFuelType(String newType, String whichType) {
    if (whichType == 'vehicleUse') {
      vehicleUseType.value = newType;
      vehicleUseUnit.value = vehicleFuelUnits[newType]![0];
      update();
    } else if (whichType == 'warming') {
      warmingfuelType.value = newType;
      warmingfuelUnit.value = warmingFuelUnits[newType]![0];
      update();
    }
  }

  void onTextChange(String value) {
    if (value.isNotEmpty) {
      if (currentIndex.value == 0) {
        indicatorIndex.value = 75;
      } else if (currentIndex.value == 1) {
        indicatorIndex.value = 150;
      } else if (currentIndex.value == 2) {
        indicatorIndex.value = 225;
      } else if (currentIndex.value == 3) {
        indicatorIndex.value = 300;
      } else if (currentIndex.value == 4) {
        indicatorIndex.value = 375;
      }
    } else {
      if (currentIndex.value == 0) {
        indicatorIndex.value = 0;
      } else if (currentIndex.value == 1) {
        indicatorIndex.value = 75;
      } else if (currentIndex.value == 2) {
        indicatorIndex.value = 150;
      } else if (currentIndex.value == 3) {
        indicatorIndex.value = 225;
      } else if (currentIndex.value == 4) {
        indicatorIndex.value = 300;
      }
    }
  }
}
