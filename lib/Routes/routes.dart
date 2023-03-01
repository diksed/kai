import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kai/Screens/MenuScreen/menu_screen.dart';

import '../Screens/IntroductionScreen/introduction_controller.dart';
import '../Screens/IntroductionScreen/introduction_screen.dart';

abstract class Routes {
  static const introduction = "/introduction";
  static const menu = "/menu";
}

abstract class AppPages {
  static String initial = Routes.introduction;

  static final routes = [
    GetPage(
        name: Routes.introduction,
        page: () => const IntroductionPage(),
        binding: BindingsBuilder.put(() => IntroductionController())),
    GetPage(
        name: Routes.menu,
        page: () => const MenuPage(),
        binding: BindingsBuilder.put(() => MenuController())),
  ];
}
