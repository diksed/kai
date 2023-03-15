import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kai/Screens/CalculationScreen/Widgets/Common/calculation_screen_scaffold.dart';
import 'package:kai/Screens/CalculationScreen/Widgets/Common/calculation_indicator.dart';
import 'package:kai/Screens/CalculationScreen/Widgets/VehicleUse/vehicle_use_dropdown_menu.dart';
import 'package:kai/Screens/CalculationScreen/Widgets/Warming/warming_dropdown_menu.dart';
import 'package:kai/Screens/CalculationScreen/calculation_controller.dart';
import 'package:kai/Utils/app_colors.dart';
import 'package:kai/Utils/app_texts.dart';
import '../../Utils/app_logo.dart';
import 'Widgets/Electric/electric_text_field_container.dart';
import 'Widgets/VehicleUse/value_dropdown_menu.dart';
import 'Widgets/Warming/value_dropdown_menu.dart';
import 'Widgets/Common/input_sized_box.dart';
import 'Widgets/Common/next_back_button.dart';

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
                    // if (int.parse(_controller.electricController.text) != 0) {
                    //   _controller.indicatorIndex.value = 75;
                    // }
                    // if (index == 0) {
                    //   _controller.indicatorIndex.value = 75;
                    // } else {
                    //   _controller.indicatorIndex.value = (index + 1) * 75;
                    // }
                  },
                  children: [
                    calculationScreen(
                        ImagesPath.electricConsumption,
                        130,
                        310,
                        IntroductionText.electricConsumption,
                        DescriptionTexts.electricConsumption,
                        inputSizedBox(_controller,
                            electricTextFieldContainer(_controller))),
                    calculationScreen(
                        ImagesPath.warmingConsumption,
                        140,
                        320,
                        IntroductionText.warmingValues,
                        DescriptionTexts.warmingConsumption,
                        inputSizedBox(
                            _controller,
                            textFieldContainerRow(
                                _controller,
                                _controller.warmingController,
                                WarmingDropdownMenu(controller: _controller),
                                warmingValueDropdownMenu(_controller)))),
                    calculationScreen(
                        ImagesPath.vehicleUse,
                        140,
                        310,
                        IntroductionText.vehicleUse,
                        DescriptionTexts.vehicleUse,
                        inputSizedBox(
                            _controller,
                            textFieldContainerRow(
                                _controller,
                                _controller.vehicleUseController,
                                VehicleUseDropdownMenu(controller: _controller),
                                vehicleUseValueDropdownMenu(_controller)))),
                    Container(color: Colors.yellow),
                    Container(color: Colors.purple),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          backNextButton(_controller,
                              _controller.onLastPage.value, DefaultTexts.back),
                          Obx(
                            () => Padding(
                              padding: EdgeInsets.only(
                                  top: 20,
                                  right: _controller.onLastPage.value ? 25 : 0),
                              child: appLogo(),
                            ),
                          ),
                          Obx(
                            () => backNextButton(
                                _controller,
                                _controller.onLastPage.value,
                                DefaultTexts.next),
                          ),
                        ],
                      ),
                      Obx(() => calculationIndicator(
                          _controller.indicatorIndex.value,
                          _controller.onLastPage.value))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
