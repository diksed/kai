import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroductionController extends GetxController {
  final PageController pageController = PageController();
  var onLastPage = false.obs;
  var currentIndex = 0.obs;
}
