import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kai/Screens/CalculationScreen/Widgets/Common/home_button.dart';
import 'package:kai/Screens/RecordScreen/Widgets/Timeline/timeline.dart';
import 'package:kai/Screens/RecordScreen/Widgets/ClearRecord/clear_record_button.dart';
import 'package:kai/Screens/RecordScreen/record_controller.dart';
import 'package:kai/Utils/app_colors.dart';
import 'package:kai/Utils/app_texts.dart';
import '../../Utils/Widgets/app_logo.dart';
import '../IntroductionScreen/Widgets/introduction_pages.dart';
import '../MenuScreen/Widgets/menu_background_image.dart';
import 'Widgets/ClearRecord/clear_record_dialog.dart';

class PastRecords extends StatefulWidget {
  const PastRecords({super.key});

  @override
  State<PastRecords> createState() => _PastRecordsState();
}

class _PastRecordsState extends State<PastRecords> {
  final RecordController _recordController = Get.put(RecordController());

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.backgroundColor,
          resizeToAvoidBottomInset: true,
          body: SizedBox(
            height: Get.height,
            width: Get.width,
            child: Stack(
              children: [
                const Align(
                    alignment: Alignment.bottomCenter,
                    child: BackgroundImage(
                        imagePath: ImagesPath.pastRecordsBackground)),
                Center(
                  child: Column(
                    children: [
                      appLogo(),
                      const Text(IntroductionText.pastRecords,
                          style: titleStyle, textAlign: TextAlign.center),
                      SizedBox(
                        height: Get.height / 1.8,
                        child: ScrollConfiguration(
                          behavior: const ScrollBehavior()
                              .copyWith(overscroll: false),
                          child: ListView(
                            children: [timelineStyle(_recordController)],
                          ),
                        ),
                      ),
                      SizedBox(height: Get.height / 67.2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                              child: const HomeButton(
                                  whichButton: '', onLastPage: true),
                              onTap: () {
                                Get.offAndToNamed(RoutesTexts.menu);
                              }),
                          GestureDetector(
                              child: const ClearRecordButton(),
                              onTap: () {
                                clearRecordDialog(_recordController);
                              }),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
