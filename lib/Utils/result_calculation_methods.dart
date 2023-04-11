import '../Screens/CalculationScreen/Widgets/Common/next_back_button.dart';
import '../Screens/CalculationScreen/calculation_controller.dart';
import '../Screens/CalculationScreen/result_controller.dart';
import 'Firebase/firestore_controller.dart';

void electricCalculationMethod(
    CalculationController controller,
    ResultController resultController,
    FirestoreController firestoreController) {
  if (controller.electricController.text.isEmpty) {
    controller.showSnackBar();
  } else {
    if (controller.electricSelectedType.value == "kWh") {
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
}

void naturalGazCalculationMethod(
    CalculationController controller,
    ResultController resultController,
    FirestoreController firestoreController) {
  if (controller.warmingfuelUnit.value == "TL") {
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
}

void fuelOilCalculationMethod(
    CalculationController controller,
    ResultController resultController,
    FirestoreController firestoreController) {
  if (controller.warmingfuelUnit.value == "TL") {
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
}

void coalCalculationMethod(
    CalculationController controller,
    ResultController resultController,
    FirestoreController firestoreController) {
  if (controller.warmingfuelUnit.value == "TL") {
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
}
