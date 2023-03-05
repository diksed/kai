import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kai/Screens/CalculationScreen/calculation_controller.dart';
import 'package:kai/Utils/app_colors.dart';
import 'package:kai/Utils/app_texts.dart';

import 'Widgets/next_back_button.dart';

class CalculationPage extends StatefulWidget {
  const CalculationPage({super.key});

  @override
  State<CalculationPage> createState() => CalculationPageState();
}

class CalculationPageState extends State<CalculationPage> {
  final CalculationController _controller = Get.put(CalculationController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Container(
            color: AppColors.backgroundColor,
            height: Get.height,
            width: Get.width,
            child: Stack(
              children: [
                PageView(
                  controller: _controller.calculationPageController,
                  onPageChanged: (index) {
                    _controller.currentIndex.value = index;
                    _controller.onLastPage.value = index == 4;
                  },
                  children: [
                    Container(color: Colors.red),
                    Container(color: Colors.blue),
                    Container(color: Colors.green),
                    Container(color: Colors.yellow),
                    Container(color: Colors.purple),
                  ],
                ),
                Positioned(
                    top: 15,
                    child: backNextButton(_controller,
                        _controller.onLastPage.value, DefaultTexts.back)),
                Positioned(
                    top: 15,
                    right: 17,
                    child: Obx(() => backNextButton(_controller,
                        _controller.onLastPage.value, DefaultTexts.next))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
