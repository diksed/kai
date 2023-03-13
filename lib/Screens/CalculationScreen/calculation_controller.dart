import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculationController extends GetxController {
  final PageController calculationPageController = PageController();
  var onLastPage = false.obs;
  var currentIndex = 0.obs;
  var indicatorIndex = 0.obs;

  final TextEditingController electricController = TextEditingController();
  var electricSelectedType = 'kWh'.obs;

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
      indicatorIndex.value = 0;
    }
  }
}
