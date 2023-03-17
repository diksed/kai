import 'package:flutter/material.dart';
import '../../../../Utils/app_colors.dart';
import '../../../IntroductionScreen/Widgets/introduction_pages.dart';
import '../../../MenuScreen/Widgets/menu_background_image.dart';

Widget calculationScreen(String imagePath, double sizedBoxHeight,
    double sizedBoxWidth, String title, String description, Widget input,
    {double padding = 70}) {
  return Scaffold(
    backgroundColor: AppColors.backgroundColor,
    body: Center(
      child: Stack(
        children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: BackgroundImage(imagePath: imagePath)),
          Padding(
            padding: EdgeInsets.only(bottom: padding),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: SizedBox(
                      height: sizedBoxHeight,
                      width: sizedBoxWidth,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(title, style: titleStyle),
                          Text(description,
                              style: bodyStyle, textAlign: TextAlign.center)
                        ],
                      ),
                    ),
                  ),
                  input
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
