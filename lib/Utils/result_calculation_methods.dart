import 'package:get/get.dart';
import 'package:kai/Screens/RecordScreen/record_controller.dart';
import 'package:kai/Utils/app_texts.dart';

import '../Screens/CalculationScreen/Widgets/Common/next_back_button.dart';
import '../Screens/CalculationScreen/Widgets/Common/snack_bar.dart';
import '../Screens/CalculationScreen/calculation_controller.dart';
import '../Screens/CalculationScreen/result_controller.dart';
import 'Firebase/firestore_controller.dart';

void calculationMethod(
    CalculationController controller,
    ResultController resultController,
    FirestoreController firestoreController,
    String type,
    {RecordController? recordController}) {
  if (type == 'electric'.tr) {
    if (controller.electricController.text.isEmpty) {
      showSnackBar();
    } else {
      if (controller.electricSelectedType.value == KeyTexts.kWh) {
        resultController.electricResultValue.value =
            (double.parse(controller.electricController.text) * 0.76);
        nextPageMethod(controller);
      } else {
        resultController.electricResultValue.value =
            (double.parse(controller.electricController.text) /
                firestoreController.electricTl.value *
                0.76);
        nextPageMethod(controller);
      }
    }
    resultController.totalCo2.value +=
        resultController.electricResultValue.value;
  } else if (type == 'naturalGas'.tr) {
    if (controller.warmingfuelUnit.value == 'tl'.tr) {
      resultController.warmingResultValue.value =
          (double.parse(controller.warmingController.text) /
              firestoreController.dogalgazTl.value *
              2.27);
      nextPageMethod(controller);
    } else {
      resultController.warmingResultValue.value =
          (double.parse(controller.warmingController.text) * 2.27);
      nextPageMethod(controller);
    }
    resultController.totalCo2.value +=
        resultController.warmingResultValue.value;
  } else if (type == 'fuelOil'.tr) {
    if (controller.warmingfuelUnit.value == 'tl'.tr) {
      resultController.warmingResultValue.value =
          (double.parse(controller.warmingController.text) /
              firestoreController.fueloilTl.value *
              2.6);
      nextPageMethod(controller);
    } else {
      resultController.warmingResultValue.value =
          (double.parse(controller.warmingController.text) * 2.6);
      nextPageMethod(controller);
    }
    resultController.totalCo2.value +=
        resultController.warmingResultValue.value;
  } else if (type == 'coal'.tr) {
    if (controller.warmingfuelUnit.value == 'tl'.tr) {
      resultController.warmingResultValue.value =
          (double.parse(controller.warmingController.text) /
              firestoreController.komurTl.value *
              2.86);
      nextPageMethod(controller);
    } else {
      resultController.warmingResultValue.value =
          (double.parse(controller.warmingController.text) * 2.86);
      nextPageMethod(controller);
    }
    resultController.totalCo2.value +=
        resultController.warmingResultValue.value;
  } else if (type == 'gasoline'.tr) {
    if (controller.vehicleUseUnit.value == 'tl'.tr) {
      resultController.fuelResultValue.value =
          (double.parse(controller.vehicleUseController.text) /
              firestoreController.benzinTl.value *
              2.3);
      nextPageMethod(controller);
    } else {
      resultController.fuelResultValue.value =
          (double.parse(controller.vehicleUseController.text) * 2.3);
      nextPageMethod(controller);
    }
    resultController.totalCo2.value += resultController.fuelResultValue.value;
  } else if (type == 'diesel'.tr) {
    if (controller.vehicleUseUnit.value == 'tl'.tr) {
      resultController.fuelResultValue.value =
          (double.parse(controller.vehicleUseController.text) /
              firestoreController.benzinTl.value *
              2.7);
      nextPageMethod(controller);
    } else {
      resultController.fuelResultValue.value =
          (double.parse(controller.vehicleUseController.text) * 2.7);
      nextPageMethod(controller);
    }
    resultController.totalCo2.value += resultController.fuelResultValue.value;
  } else if (type == 'lpg'.tr) {
    if (controller.vehicleUseUnit.value == 'tl'.tr) {
      resultController.fuelResultValue.value =
          (double.parse(controller.vehicleUseController.text) /
              firestoreController.benzinTl.value *
              1.5);
      nextPageMethod(controller);
    } else {
      resultController.fuelResultValue.value =
          (double.parse(controller.vehicleUseController.text) * 1.5);
      nextPageMethod(controller);
    }
    resultController.totalCo2.value += resultController.fuelResultValue.value;
  } else if (type == KeyTexts.food) {
    resultController.foodResultValue.value +=
        (double.parse(controller.meatController.text) * 27.5);
    resultController.foodResultValue.value +=
        (double.parse(controller.milkController.text) * 1.2);
    resultController.foodResultValue.value +=
        (double.parse(controller.greengroceryController.text) * 0.2);
    nextPageMethod(controller);
    resultController.totalCo2.value += resultController.foodResultValue.value;
    recordController!.addRecord(resultController.totalCo2.value);
  }
}
