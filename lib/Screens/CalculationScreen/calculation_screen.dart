import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kai/Screens/CalculationScreen/Widgets/Common/calculation_screen_scaffold.dart';
import 'package:kai/Screens/CalculationScreen/Widgets/VehicleUse/vehicle_use_dropdown_menu.dart';
import 'package:kai/Screens/CalculationScreen/Widgets/Warming/warming_dropdown_menu.dart';
import 'package:kai/Screens/CalculationScreen/calculation_controller.dart';
import 'package:kai/Utils/app_colors.dart';
import 'package:kai/Utils/app_logo.dart';
import 'package:kai/Utils/app_texts.dart';
import 'Widgets/Common/calculation_indicator.dart';
import 'Widgets/Common/next_back_button.dart';
import 'Widgets/Electric/one_text_field_container.dart';
import 'Widgets/Food/food_input_sized_box.dart';
import 'Widgets/VehicleUse/value_dropdown_menu.dart';
import 'Widgets/Warming/value_dropdown_menu.dart';
import 'Widgets/Common/input_sized_box.dart';

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
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _controller.calculationPageController,
                  onPageChanged: (index) {
                    _controller.currentIndex.value = index;
                    _controller.onLastPage.value = index == 4;
                  },
                  children: [
                    calculationScreen(
                        ImagesPath.electricConsumption,
                        130,
                        310,
                        IntroductionText.electricConsumption,
                        DescriptionTexts.electricConsumption,
                        inputSizedBox(
                            _controller,
                            oneTextFieldContainer(
                                _controller,
                                _controller.electricController,
                                true,
                                height: 60,
                                width: 250,
                                padding: 0,
                                ''),
                            '')),
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
                                warmingValueDropdownMenu(_controller)),
                            '')),
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
                                vehicleUseValueDropdownMenu(_controller)),
                            'vehicleUse')),
                    calculationScreen(
                        ImagesPath.foodConsumption,
                        160,
                        310,
                        IntroductionText.foodConsumption,
                        DescriptionTexts.foodConsumption,
                        foodInputSizedBox(_controller),
                        padding: 0),
                    Container(color: Colors.purple),
                  ],
                ),
                Center(
                  child: Obx(
                    () => Column(
                      children: [
                        appLogo(),
                        calculationIndicator(_controller.indicatorIndex.value,
                            _controller.onLastPage.value)
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 100,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      backNextButton(_controller, _controller.onLastPage.value,
                          DefaultTexts.back),
                      Obx(
                        () => backNextButton(_controller,
                            _controller.onLastPage.value, DefaultTexts.next),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
