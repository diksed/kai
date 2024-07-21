import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kai/Screens/CalculationScreen/Widgets/Common/snack_bar.dart';
import 'package:kai/Screens/CalculationScreen/calculation_controller.dart';
import 'package:kai/Screens/CalculationScreen/result_controller.dart';
import 'package:kai/Screens/RecordScreen/record_controller.dart';
import 'package:kai/Utils/Firebase/firestore_controller.dart';
import 'package:kai/Utils/app_texts.dart';

import '../../../../Utils/result_calculation_methods.dart';
import 'home_button.dart';

Widget backNextButton(
    CalculationController controller,
    bool onLastPage,
    String whichButton,
    ResultController resultController,
    FirestoreController firestoreController,
    RecordController recordController) {
  return GestureDetector(
    onTap: () async {
      if (whichButton == 'back'.tr) {
        if (controller.currentIndex.value == 0) {
          Get.offAndToNamed(RoutesTexts.menu);
        } else {
          controller.currentIndex.value--;
          controller.calculationPageController.previousPage(
              duration: const Duration(milliseconds: 500), curve: Curves.ease);
        }
      } else {
        if (onLastPage) {
          Get.toNamed(RoutesTexts.menu);
          Get.delete<CalculationController>();
          Get.delete<ResultController>();
        } else {
          if (controller.currentIndex.value == 0) {
            calculationMethod(controller, resultController, firestoreController,
                'electric'.tr);
          } else if (controller.currentIndex.value == 1) {
            if (controller.warmingController.text.isEmpty) {
              showSnackBar();
            } else {
              if (controller.warmingfuelType.value == 'naturalGas'.tr) {
                calculationMethod(controller, resultController,
                    firestoreController, 'naturalGas'.tr);
              } else if (controller.warmingfuelType.value == 'fuelOil'.tr) {
                calculationMethod(controller, resultController,
                    firestoreController, 'fuelOil'.tr);
              } else {
                calculationMethod(controller, resultController,
                    firestoreController, 'coal'.tr);
              }
            }
          } else if (controller.currentIndex.value == 2) {
            if (controller.isVehicleUsed.value == false) {
              if (controller.vehicleUseController.text.isEmpty) {
                showSnackBar();
              } else {
                if (controller.vehicleUseType.value == 'gasoline'.tr) {
                  calculationMethod(controller, resultController,
                      firestoreController, 'gasoline'.tr);
                } else if (controller.vehicleUseType.value == 'diesel'.tr) {
                  calculationMethod(controller, resultController,
                      firestoreController, 'diesel'.tr);
                } else {
                  calculationMethod(controller, resultController,
                      firestoreController, 'lpg'.tr);
                }
              }
            } else {
              resultController.fuelResultValue.value = 0;
              nextPageMethod(controller);
            }
          } else if (controller.currentIndex.value == 3) {
            if (controller.meatController.text.isEmpty ||
                controller.milkController.text.isEmpty ||
                controller.greengroceryController.text.isEmpty) {
              showSnackBar();
            } else {
              calculationMethod(controller, resultController,
                  firestoreController, KeyTexts.food,
                  recordController: recordController);
            }
          }
        }
      }
    },
    child: HomeButton(whichButton: whichButton, onLastPage: onLastPage),
  );
}

void nextPageMethod(CalculationController controller) {
  controller.calculationPageController.nextPage(
      duration: const Duration(milliseconds: 500), curve: Curves.ease);
}
