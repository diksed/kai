import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculationController extends GetxController {
  final PageController calculationPageController = PageController();
  var onLastPage = false.obs;
  var currentIndex = 0.obs;
  var indicatorIndex = 75.obs;
}
