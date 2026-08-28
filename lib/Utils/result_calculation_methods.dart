import 'package:get/get.dart';
import 'package:kai/Screens/RecordScreen/record_controller.dart';
import 'package:kai/Utils/app_texts.dart';
import 'package:kai/Utils/emission_factors.dart';
import 'package:kai/Utils/interstitial_ad_manager.dart';

import '../Screens/CalculationScreen/Widgets/Common/next_back_button.dart';
import '../Screens/CalculationScreen/Widgets/Common/snack_bar.dart';
import '../Screens/CalculationScreen/calculation_controller.dart';
import '../Screens/CalculationScreen/result_controller.dart';

/// Recomputes the running total from the four category subtotals instead of
/// accumulating with `+=`. Each category screen can be revisited (back
/// button, re-entering a value) without double-counting into the total.
void _recomputeTotal(ResultController resultController) {
  resultController.totalCo2.value = resultController.electricResultValue.value +
      resultController.warmingResultValue.value +
      resultController.fuelResultValue.value +
      resultController.foodResultValue.value;
}

void calculationMethod(
    CalculationController controller,
    ResultController resultController,
    String type, {
  RecordController? recordController,
}) {
  if (type == 'electric'.tr) {
    if (controller.electricController.text.isEmpty) {
      showSnackBar();
      return;
    }
    resultController.electricResultValue.value =
        double.parse(controller.electricController.text) *
            EmissionFactors.electricityKwh;
    nextPageMethod(controller);
    _recomputeTotal(resultController);
  } else if (type == 'naturalGas'.tr) {
    resultController.warmingResultValue.value =
        double.parse(controller.warmingController.text) *
            EmissionFactors.naturalGasM3;
    nextPageMethod(controller);
    _recomputeTotal(resultController);
  } else if (type == 'fuelOil'.tr) {
    resultController.warmingResultValue.value =
        double.parse(controller.warmingController.text) *
            EmissionFactors.fuelOilLiter;
    nextPageMethod(controller);
    _recomputeTotal(resultController);
  } else if (type == 'coal'.tr) {
    resultController.warmingResultValue.value =
        double.parse(controller.warmingController.text) *
            EmissionFactors.coalKg;
    nextPageMethod(controller);
    _recomputeTotal(resultController);
  } else if (type == 'gasoline'.tr) {
    resultController.fuelResultValue.value =
        double.parse(controller.vehicleUseController.text) *
            EmissionFactors.gasolineLiter;
    nextPageMethod(controller);
    _recomputeTotal(resultController);
  } else if (type == 'diesel'.tr) {
    resultController.fuelResultValue.value =
        double.parse(controller.vehicleUseController.text) *
            EmissionFactors.dieselLiter;
    nextPageMethod(controller);
    _recomputeTotal(resultController);
  } else if (type == 'lpg'.tr) {
    resultController.fuelResultValue.value =
        double.parse(controller.vehicleUseController.text) *
            EmissionFactors.vehicleLpgLiter;
    nextPageMethod(controller);
    _recomputeTotal(resultController);
  } else if (type == KeyTexts.food) {
    resultController.foodResultValue.value =
        (double.parse(controller.meatController.text) * EmissionFactors.meatKg) +
            (double.parse(controller.milkController.text) *
                EmissionFactors.milkLiter) +
            (double.parse(controller.greengroceryController.text) *
                EmissionFactors.greengroceryKg);
    nextPageMethod(controller);
    _recomputeTotal(resultController);
    recordController!.addRecord(
      electricCo2: resultController.electricResultValue.value,
      warmingCo2: resultController.warmingResultValue.value,
      fuelCo2: resultController.fuelResultValue.value,
      foodCo2: resultController.foodResultValue.value,
      totalCo2: resultController.totalCo2.value,
    );
    // Last input screen → result screen: show the preloaded interstitial,
    // if it's ready. It was requested back when the calculation flow
    // started, so it's had the whole flow's worth of typing time to load.
    InterstitialAdManager.instance.showIfReady();
  }
}
