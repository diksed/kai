import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kai/Screens/MenuScreen/Widgets/info_message.dart';
import 'package:kai/Utils/app_colors.dart';
import 'package:kai/Utils/app_texts.dart';
import '../../Utils/Firebase/firestore_controller.dart';
import '../../Utils/Widgets/app_logo.dart';
import '../DonateScreen/donate_screen.dart';
import 'Widgets/menu_background_image.dart';
import 'Widgets/menu_button.dart';
import 'menu_controller.dart';

class MenuPage extends StatelessWidget {
  MenuPage({super.key});
  final FirestoreController firestoreController =
      Get.put(FirestoreController());
  final MenuPageController menuController = Get.put(MenuPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: PopScope(
        onPopInvoked: (didPop) async {
          menuController.onBackPressed(context);
        },
        canPop: false,
        child: SafeArea(
          child: Center(
            child: Stack(
              children: [
                const Align(
                    alignment: Alignment.bottomCenter,
                    child:
                        BackgroundImage(imagePath: ImagesPath.menuBackground)),
                Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        appLogo(),
                        MenuButton(
                            image: ImagesPath.calculateKai,
                            text: 'menuKaiCalculate'.tr,
                            onTap: () {
                              Get.toNamed(RoutesTexts.calculation);
                              Get.delete<MenuPageController>();
                            }),
                        MenuButton(
                          image: ImagesPath.donate,
                          text: 'menuDonate'.tr,
                          onTap: () {
                            donateBottomSheet();
                          },
                        ),
                        MenuButton(
                            image: ImagesPath.pastRecords,
                            text: 'menuPastRecords'.tr,
                            onTap: () {
                              Get.toNamed(RoutesTexts.pastRecords);
                              Get.delete<MenuPageController>();
                            }),
                        Obx(() => InfoMessage(
                            text: menuController.infoMessage.value)),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
