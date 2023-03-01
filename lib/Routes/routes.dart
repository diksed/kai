import 'package:get/get.dart';

import '../Screens/IntroductionScreen/introduction_controller.dart';
import '../Screens/IntroductionScreen/introduction_screen.dart';

abstract class Routes {
  static const introduction = "/introduction";
}

abstract class AppPages {
  static String initial = Routes.introduction;

  static final routes = [
    GetPage(
        name: Routes.introduction,
        page: () => const IntroductionPage(),
        binding: BindingsBuilder.put(() => IntroductionController())),
  ];
}
