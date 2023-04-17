import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kai/Routes/routes.dart';
import 'package:kai/Screens/MenuScreen/menu_screen.dart';
import 'package:kai/Utils/app_texts.dart';
import 'Screens/IntroductionScreen/introduction_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: appRoutes(),
      home: box.read(IntroductionText.isIntroShown) == null || false
          ? const IntroductionPage()
          : MenuPage(),
    );
  }
}
