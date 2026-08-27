import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kai/Screens/CalculationScreen/Widgets/Common/home_button.dart';
import 'package:kai/Screens/RecordScreen/Widgets/Timeline/timeline.dart';
import 'package:kai/Screens/RecordScreen/Widgets/ClearRecord/clear_record_button.dart';
import 'package:kai/Screens/RecordScreen/record_controller.dart';
import 'package:kai/Utils/app_colors.dart';
import 'package:kai/Utils/app_texts.dart';
import '../../Utils/Widgets/app_logo.dart';
import '../../Utils/Widgets/banner_ad_widget.dart';
import '../IntroductionScreen/Widgets/introduction_pages.dart';
import '../MenuScreen/Widgets/menu_background_image.dart';
import 'Widgets/ClearRecord/clear_record_dialog.dart';

class PastRecords extends StatefulWidget {
  const PastRecords({super.key, this.adSlot});

  /// Overridable in tests so layout can be verified without the real
  /// (network-backed) ad SDK. Defaults to the real [BannerAdWidget].
  final Widget? adSlot;

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
                // SingleChildScrollView instead of a bare Column: the banner
                // ad adds extra height on top of an already screen-filling
                // layout, so on shorter devices (or larger system font
                // scale) the content no longer reliably fits in one
                // viewport. Scrolling is a safety net; the sizes below are
                // still tuned to fit without scrolling on most phones.
                SingleChildScrollView(
                  child: Column(
                    children: [
                      appLogo(),
                      Text('pastRecords'.tr,
                          style: titleStyle, textAlign: TextAlign.center),
                      SizedBox(
                        height: Get.height / 2.1,
                        child: ScrollConfiguration(
                          behavior: const ScrollBehavior()
                              .copyWith(overscroll: false),
                          child: ListView(
                            children: [
                              timelineStyle(
                                  _recordController, () => setState(() {})),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: Get.height / 85),
                      widget.adSlot ?? const BannerAdWidget(),
                      SizedBox(height: Get.height / 85),
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
                      ),
                      SizedBox(height: Get.height / 85),
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
