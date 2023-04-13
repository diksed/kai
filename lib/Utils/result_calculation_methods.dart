import '../Screens/CalculationScreen/Widgets/Common/next_back_button.dart';
import '../Screens/CalculationScreen/calculation_controller.dart';
import '../Screens/CalculationScreen/result_controller.dart';
import 'Firebase/firestore_controller.dart';

void calculationMethod(
    CalculationController controller,
    ResultController resultController,
    FirestoreController firestoreController,
    String type) {
  if (type == "electric") {
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
  } else if (type == "naturalGas") {
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
  } else if (type == "fuelOil") {
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
  } else if (type == "coal") {
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
  } else if (type == "gasoline") {
    if (controller.vehicleUseUnit.value == "TL") {
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
  } else if (type == "diesel") {
    if (controller.vehicleUseUnit.value == "TL") {
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
  } else if (type == "lpg") {
    if (controller.vehicleUseUnit.value == "TL") {
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
  } else if (type == "food") {
    resultController.foodResultValue.value +=
        (double.parse(controller.meatController.text) * 27.5);
    resultController.foodResultValue.value +=
        (double.parse(controller.milkController.text) * 1.2);
    resultController.foodResultValue.value +=
        (double.parse(controller.greengroceryController.text) * 0.2);
    nextPageMethod(controller);
  }
}
