import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kai/Screens/IntroductionScreen/introduction_controller.dart';
import 'package:kai/Utils/app_texts.dart';
import 'Widgets/introduction_dots_column.dart';
import 'Widgets/introduction_pages.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({super.key});

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  final IntroductionController _controller = Get.put(IntroductionController());
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller.pageController,
            onPageChanged: (index) {
              _controller.currentIndex.value = index;
              _controller.onLastPage.value = index == 2;
            },
            physics: const NeverScrollableScrollPhysics(),
            children: [
              pageOneThird(
                  ImagesPath.carboonFootprint, IntroductionText.descriptionOne),
              pageTwo(),
              pageOneThird(
                  ImagesPath.saveWorld, IntroductionText.descriptionTwo),
            ],
          ),
          Positioned(
              bottom: Get.height / 22.4,
              right: 0,
              left: 0,
              child: Obx(() => buttonDotsColumn(_controller.pageController,
                  _controller.onLastPage.value, _controller, box)))
        ],
      ),
    );
  }
}
