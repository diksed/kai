import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kai/Utils/app_colors.dart';
import 'package:kai/Utils/app_texts.dart';

import '../../Utils/app_logo.dart';
import 'Widgets/menu_background_image.dart';
import 'Widgets/menu_button.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Center(
          child: Stack(
            children: [
              Center(
                child: Column(children: [
                  const SizedBox(height: 30),
                  appLogo(),
                  const SizedBox(height: 60),
                  MenuButton(
                      image: ImagesPath.calculateKai,
                      text: MenuTexts.kaiCalculate,
                      onTap: () {
                        Get.toNamed('/calculation');
                      }),
                  const SizedBox(height: 60),
                  MenuButton(
                    image: ImagesPath.facts,
                    text: MenuTexts.facts,
                    onTap: () {},
                  ),
                  const SizedBox(height: 60),
                  MenuButton(
                      image: ImagesPath.donate,
                      text: MenuTexts.donate,
                      onTap: () {}),
                ]),
              ),
              const Align(
                  alignment: Alignment.bottomCenter, child: BackgroundImage()),
            ],
          ),
        ),
      ),
    );
  }
}
