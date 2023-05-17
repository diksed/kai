import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kai/Utils/app_colors.dart';
import 'package:kai/Utils/app_texts.dart';

import 'splash_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final splashController = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(child: Image.asset(ImagesPath.splash)),
    );
  }
}
