import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kai/Screens/CalculationScreen/calculation_controller.dart';
import 'package:kai/Screens/CalculationScreen/result_controller.dart';
import 'package:kai/Screens/IntroductionScreen/Widgets/introduction_pages.dart';
import 'package:kai/Utils/Firebase/firestore_controller.dart';
import 'package:kai/Utils/app_colors.dart';
import 'package:kai/Utils/app_texts.dart';

import '../../../../Utils/result_calculation_methods.dart';

Widget backNextButton(
    CalculationController controller,
    bool onLastPage,
    String whichButton,
    ResultController resultController,
    FirestoreController firestoreController) {
  return GestureDetector(
    onTap: () async {
      if (whichButton == DefaultTexts.back) {
        if (controller.currentIndex.value == 0) {
          Get.back();
        } else {
          controller.currentIndex.value--;
          // controller.indicatorIndex.value -= 75;
          controller.calculationPageController.previousPage(
              duration: const Duration(milliseconds: 500), curve: Curves.ease);
        }
      } else {
        if (onLastPage) {
          Get.toNamed(RoutesTexts.menu);
          Get.delete<CalculationController>();
        } else {
          if (controller.currentIndex.value == 0) {
            calculationMethod(
                controller, resultController, firestoreController, "electric");
          } else if (controller.currentIndex.value == 1) {
            if (controller.warmingController.text.isEmpty) {
              controller.showSnackBar();
            } else {
              if (controller.warmingfuelType.value == "Doğalgaz") {
                calculationMethod(controller, resultController,
                    firestoreController, "naturalGas");
              } else if (controller.warmingfuelType.value == "Fuel-Oil") {
                calculationMethod(controller, resultController,
                    firestoreController, "fuelOil");
              } else {
                calculationMethod(
                    controller, resultController, firestoreController, "coal");
              }
            }
          } else if (controller.currentIndex.value == 2) {
            if (controller.isVehicleUsed.value == false) {
              if (controller.vehicleUseController.text.isEmpty) {
                controller.showSnackBar();
              } else {
                if (controller.vehicleUseType.value == "Benzin") {
                  calculationMethod(controller, resultController,
                      firestoreController, "gasoline");
                } else if (controller.vehicleUseType.value == "Dizel") {
                  calculationMethod(controller, resultController,
                      firestoreController, "diesel");
                } else {
                  calculationMethod(
                      controller, resultController, firestoreController, "lpg");
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
              controller.showSnackBar();
            } else {
              calculationMethod(
                  controller, resultController, firestoreController, "food");
            }
          }
        }
      }
    },
    child: Container(
      height: 40,
      width: 70,
      decoration: const BoxDecoration(
          color: AppColors.indicatorBackground,
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 3),
                blurRadius: 6,
                spreadRadius: 0)
          ],
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          whichButton == DefaultTexts.back
              ? const Icon(Icons.arrow_back_ios, color: Colors.white, size: 12)
              : const SizedBox(),
          Text(onLastPage ? '' : whichButton, style: bodyStyle),
          whichButton == DefaultTexts.back
              ? const SizedBox()
              : Icon(onLastPage ? Icons.home : Icons.arrow_forward_ios,
                  color: Colors.white, size: onLastPage ? 20 : 12),
        ],
      ),
    ),
  );
}

void nextPageMethod(CalculationController controller) {
  controller.calculationPageController.nextPage(
      duration: const Duration(milliseconds: 500), curve: Curves.ease);
}
