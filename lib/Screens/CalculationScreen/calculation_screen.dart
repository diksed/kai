import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kai/Screens/CalculationScreen/Widgets/Common/calculation_screen_scaffold.dart';
import 'package:kai/Screens/CalculationScreen/Widgets/VehicleUse/vehicle_use_dropdown_menu.dart';
import 'package:kai/Screens/CalculationScreen/Widgets/Warming/warming_dropdown_menu.dart';
import 'package:kai/Screens/CalculationScreen/calculation_controller.dart';
import 'package:kai/Screens/CalculationScreen/result_controller.dart';
import 'package:kai/Screens/RecordScreen/record_controller.dart';
import 'package:kai/Utils/Firebase/firestore_controller.dart';
import 'package:kai/Utils/app_colors.dart';
import 'package:kai/Utils/app_texts.dart';
import 'Widgets/Electric/one_text_field_container.dart';
import 'Widgets/Food/food_calculation_screen.dart';
import 'Widgets/Food/food_input_sized_box.dart';
import 'Widgets/Result/result_calculation_screen.dart';
import 'Widgets/Result/result_input.dart';
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
  final ResultController _resultController = Get.put(ResultController());
  final FirestoreController _firestoreController = Get.find();
  final RecordController _recordController = Get.put(RecordController());
  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _controller.messengerKey,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: Container(
            color: AppColors.backgroundColor,
            height: Get.height,
            width: Get.width,
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _controller.calculationPageController,
              onPageChanged: (index) {
                _controller.currentIndex.value = index;
                _controller.onLastPage.value = index == 4;
              },
              children: [
                calculationScreen(
                    ImagesPath.electricConsumption,
                    Get.height / 5.169,
                    Get.width / 1.161,
                    'electricConsumption'.tr,
                    'descElectricConsumption'.tr,
                    inputSizedBox(
                        _controller,
                        oneTextFieldContainer(
                          _controller,
                          _controller.electricController,
                          true,
                          '',
                          TextInputAction.done,
                          Get.height / 11.2,
                          Get.width / 1.44,
                          0,
                        ),
                        ''),
                    _controller,
                    _resultController,
                    _firestoreController,
                    _recordController),
                calculationScreen(
                    ImagesPath.warmingConsumption,
                    Get.height / 4.8,
                    Get.width / 1.125,
                    'warmingValues'.tr,
                    'descWarmingConsumption'.tr,
                    inputSizedBox(
                        _controller,
                        textFieldContainerRow(
                            _controller,
                            _controller.warmingController,
                            WarmingDropdownMenu(controller: _controller),
                            warmingValueDropdownMenu(_controller)),
                        ''),
                    _controller,
                    _resultController,
                    _firestoreController,
                    _recordController),
                Obx(
                  () => calculationScreen(
                      ImagesPath.vehicleUse,
                      Get.height / 4.8,
                      Get.width / 1.161,
                      'vehicleUse'.tr,
                      'descVehicleUse'.tr,
                      inputSizedBox(
                          _controller,
                          textFieldContainerRow(
                              _controller,
                              _controller.vehicleUseController,
                              VehicleUseDropdownMenu(controller: _controller),
                              vehicleUseValueDropdownMenu(_controller),
                              isVehicleUsed: !_controller.isVehicleUsed.value),
                          KeyTexts.vehicleUse),
                      _controller,
                      _resultController,
                      _firestoreController,
                      _recordController),
                ),
                foodCalculationScreen(
                    ImagesPath.foodConsumption,
                    Get.height / 4.48,
                    Get.width,
                    'foodConsumption'.tr,
                    'descFoodConsumption'.tr,
                    foodInputSizedBox(_controller),
                    _controller,
                    _resultController,
                    _firestoreController,
                    _recordController),
                resultCalculationScreen(
                    ImagesPath.saveWorld,
                    Get.height / 4.8,
                    Get.width,
                    'result'.tr,
                    'descResult'.tr,
                    Obx(
                      () => (resultInput(
                          (_resultController.electricResultValue.value),
                          (_resultController.warmingResultValue.value),
                          (_resultController.fuelResultValue.value),
                          (_resultController.foodResultValue.value),
                          (_resultController.totalCo2.value))),
                    ),
                    _controller,
                    _resultController,
                    _firestoreController,
                    _recordController)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
