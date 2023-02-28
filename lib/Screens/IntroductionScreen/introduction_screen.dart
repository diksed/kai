import 'package:flutter/material.dart';
import 'package:kai/Utils/app_texts.dart';
import 'Widgets/introduction_dots_column.dart';
import 'Widgets/introduction_pages.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({super.key});

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  final PageController _pageController = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                onLastPage = index == 2;
              });
            },
            // physics: const NeverScrollableScrollPhysics(),
            children: [
              pageOneThird(
                  ImagesPath.carboonFootprint, IntroductionText.descriptionOne),
              pageTwo(),
              pageOneThird(
                  ImagesPath.saveWorld, IntroductionText.descriptionTwo),
            ],
          ),
          Positioned(
              bottom: 30,
              right: 0,
              left: 0,
              child: buttonDotsColumn(_pageController, onLastPage))
        ],
      ),
    );
  }
}
