import 'package:get/get.dart';
import 'package:kai/Screens/MenuScreen/menu_screen.dart';
import 'package:kai/Screens/RecordScreen/record_screen.dart';
import '../Screens/CalculationScreen/calculation_screen.dart';
import '../Screens/IntroductionScreen/introduction_screen.dart';
import '../Utils/app_texts.dart';

appRoutes() => [
      GetPage(
          name: RoutesTexts.introduction,
          page: () => const IntroductionPage(),
          transition: Transition.fade,
          transitionDuration: const Duration(milliseconds: 600)),
      GetPage(
          name: RoutesTexts.menu,
          page: () => MenuPage(),
          transition: Transition.fade,
          transitionDuration: const Duration(milliseconds: 600)),
      GetPage(
          name: RoutesTexts.calculation,
          page: () => const CalculationPage(),
          transition: Transition.fade,
          transitionDuration: const Duration(milliseconds: 600)),
      GetPage(
          name: RoutesTexts.pastRecords,
          page: () => const PastRecords(),
          transition: Transition.fade,
          transitionDuration: const Duration(milliseconds: 600)),
    ];
