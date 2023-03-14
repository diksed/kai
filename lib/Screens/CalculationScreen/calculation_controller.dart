import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculationController extends GetxController {
  final PageController calculationPageController = PageController();
  var onLastPage = false.obs;
  var currentIndex = 0.obs;
  var indicatorIndex = 0.obs;

  final TextEditingController electricController = TextEditingController();
  final TextEditingController warmingController = TextEditingController();
  var electricSelectedType = 'kWh'.obs;
  var warmingfuelType = 'Doğalgaz'.obs;
  var warmingfuelUnit = 'm³'.obs;
  final List<String> carFuelTypes = ['Benzin', 'Dizel', 'LPG'];
  final List<String> warmingFuelTypes = [
    'Doğalgaz',
    'LPG',
    'Fuel-Oil',
    'Kömür'
  ];
  final Map<String, List<String>> fuelUnits = {
    'Doğalgaz': ['m³', 'TL'],
    'LPG': ['Lt.', 'TL'],
    'Fuel-Oil': ['Lt.', 'TL'],
    'Kömür': ['Kg', 'TL'],
  };

  void updateSelectedFuelType(String newType) {
    warmingfuelType.value = newType;
    warmingfuelUnit.value = fuelUnits[newType]![0];
    update();
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
