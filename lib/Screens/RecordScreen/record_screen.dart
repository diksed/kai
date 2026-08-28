import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kai/Screens/CalculationScreen/Widgets/Common/home_button.dart';
import 'package:kai/Screens/RecordScreen/Widgets/Timeline/empty_records_view.dart';
import 'package:kai/Screens/RecordScreen/Widgets/Timeline/timeline.dart';
import 'package:kai/Screens/RecordScreen/Widgets/ClearRecord/clear_record_button.dart';
import 'package:kai/Screens/RecordScreen/record_controller.dart';
import 'package:kai/Utils/app_colors.dart';
import 'package:kai/Utils/app_texts.dart';
import 'package:kai/Utils/layout.dart';
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
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        resizeToAvoidBottomInset: true,
        // Pinned to the true bottom edge of the screen, full width, outside
        // the body entirely — nothing above it can push it around or clip
        // it, and it never eats into the body's own space.
        bottomNavigationBar: widget.adSlot ?? const BannerAdWidget(),
        // SafeArea wraps the body only, not bottomNavigationBar — so the
        // banner ad can sit flush at the true bottom edge while the body's
        // own content still avoids notches/gesture areas.
        body: SafeArea(
          child: Stack(
            children: [
              const Align(
                  alignment: Alignment.bottomCenter,
                  child: BackgroundImage(
                      imagePath: ImagesPath.pastRecordsBackground)),
              // A Column with an Expanded list — instead of fixed
              // Get.height fractions — so the logo/title/buttons always get
              // their natural size first and the record list simply takes
              // whatever's left. That's what actually guarantees the button
              // row is never clipped, regardless of the bottom banner's
              // height or the device's screen size.
              Column(
                children: [
                  appLogo(),
                  Text('pastRecords'.tr,
                      style: titleStyle, textAlign: TextAlign.center),
                  Expanded(
                    // Rendered outside the ListView (not just as its empty
                    // branch) so it can actually be centered in the
                    // available space instead of stuck at the top.
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: kScreenHPadding),
                      child: _recordController.getRecords().isEmpty
                          ? const EmptyRecordsView()
                          : ScrollConfiguration(
                              behavior: const ScrollBehavior()
                                  .copyWith(overscroll: false),
                              child: ListView(
                                children: [
                                  timelineStyle(_recordController,
                                      () => setState(() {})),
                                ],
                              ),
                            ),
                    ),
                  ),
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
                      // Nothing to clear when there are no records — showing
                      // it anyway just invites tapping "clear everything" on
                      // an already-empty list.
                      if (_recordController.getRecords().isNotEmpty)
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
            ],
          ),
        ),
      ),
    );
  }
}
