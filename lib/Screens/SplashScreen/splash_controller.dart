import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kai/Utils/app_texts.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 3), () {
      if (GetStorage().read(IntroductionText.isIntroShown) == null || false) {
        Get.offNamed(RoutesTexts.introduction);
      } else {
        Get.offNamed(RoutesTexts.menu);
      }
    });
  }
}
