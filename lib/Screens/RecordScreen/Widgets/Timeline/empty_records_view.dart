import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Utils/app_colors.dart';
import '../../../../Utils/app_texts.dart';

/// Shown instead of the timeline when there are no past records yet.
///
/// Previously this was just the screen's own title ("Past Records") sitting
/// alone in a small, dim font in the middle of an otherwise empty screen —
/// easy to mistake for a loading state rather than "you haven't calculated
/// anything yet". This gives it an icon, an actual explanation, and a way
/// to go do something about it.
class EmptyRecordsView extends StatelessWidget {
  const EmptyRecordsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width / 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.eco_outlined,
                size: Get.width / 5, color: Colors.white70),
            SizedBox(height: Get.height / 60),
            Text(
              'emptyRecordsTitle'.tr,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(height: Get.height / 150),
            Text(
              'emptyRecordsSubtitle'.tr,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white70, fontSize: 14),
            ),
            SizedBox(height: Get.height / 45),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.indicatorBackground,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                padding: EdgeInsets.symmetric(
                    horizontal: Get.width / 10, vertical: Get.height / 90),
              ),
              onPressed: () => Get.toNamed(RoutesTexts.calculation),
              child: Text(
                'calculateNow'.tr,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
