import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kai/Screens/IntroductionScreen/Widgets/introduction_pages.dart';
import 'package:kai/Utils/app_colors.dart';

import '../../Utils/app_texts.dart';
import '../MenuScreen/Widgets/menu_background_image.dart';
import '../RecordScreen/record_controller.dart';

void donateBottomSheet() {
  final RecordController recordController = Get.put(RecordController());

  Get.bottomSheet(
    Stack(children: [
      const Align(
          alignment: Alignment.bottomCenter,
          child: BackgroundImage(imagePath: ImagesPath.menuBackground)),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Center(
            child: Text('Fidan Bağışla', style: notWhiteTitleStyle),
          ),
          Center(
            child: SizedBox(
              width: Get.width / 1.2,
              child: Text.rich(
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20, color: Colors.black),
                TextSpan(
                  text: 'Yaptığınız en son işleme göre doğaya olan borcunuz ',
                  children: [
                    TextSpan(
                      text: '${recordController.resultTree()}',
                      style: const TextStyle(
                        color: Colors.red,
                      ),
                    ),
                    const TextSpan(
                      text:
                          ' ağaç.\n\n\n Fidan bağışı yaparak doğaya verdiğiniz zararı denkleştirebilirsiniz.',
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[400]),
                    onPressed: () {
                      recordController.resultTree();
                      Get.back();
                    },
                    child: const Text('Vazgeç', style: bodyStyle)),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.backgroundColor),
                    onPressed: () {
                      recordController.launchURL();
                    },
                    child: const Text('Bağış Yap', style: bodyStyle))
              ],
            ),
          ),
        ],
      ),
    ]),
    backgroundColor: Colors.white,
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  );
}
