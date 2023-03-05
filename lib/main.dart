import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kai/Routes/routes.dart';
import 'package:kai/Utils/app_texts.dart';
import 'package:kai/Utils/get_storage.dart';
import 'Screens/IntroductionScreen/introduction_screen.dart';
import 'Screens/MenuScreen/menu_screen.dart';

void main() async {
  await GetStorage.init();
  bool? isIntroShown = isShown.read(IntroductionText.isIntroShown);
  runApp(MyApp(isIntroShown: isIntroShown));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.isIntroShown});
  final bool? isIntroShown;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: appRoutes(),
      home: isIntroShown == null || isIntroShown == true
          ? const IntroductionPage()
          : const MenuPage(),
    );
  }
}
