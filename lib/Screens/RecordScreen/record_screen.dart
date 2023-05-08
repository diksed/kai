import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kai/Screens/CalculationScreen/Widgets/Common/home_button.dart';
import 'package:kai/Screens/RecordScreen/Widgets/Timeline/timeline.dart';
import 'package:kai/Screens/RecordScreen/record_controller.dart';
import 'package:kai/Utils/app_texts.dart';
import '../../Utils/Widgets/app_logo.dart';
import '../../Utils/app_colors.dart';
import '../IntroductionScreen/Widgets/introduction_pages.dart';
import '../MenuScreen/Widgets/menu_background_image.dart';

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
          resizeToAvoidBottomInset: true,
          body: Container(
            color: AppColors.backgroundColor,
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
                        height: Get.height / 1.7,
                        child: ScrollConfiguration(
                          behavior: const ScrollBehavior()
                              .copyWith(overscroll: false),
                          child: ListView(
                            children: [timelineStyle(_recordController)],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                          child: const HomeButton(
                              whichButton: '', onLastPage: true),
                          onTap: () {
                            Get.offAndToNamed(RoutesTexts.menu);
                          })
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

Widget falan() {
  return Container();
}
