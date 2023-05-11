import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../Utils/Widgets/image_opacity.dart';
import 'introduction_pages.dart';

class IntroductionRow extends StatelessWidget {
  const IntroductionRow({
    super.key,
    required this.image,
    required this.text,
  });
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            height: Get.height / 9.6, width: 70, child: imageOpacity(image)),
        const SizedBox(width: 40),
        SizedBox(
            height: Get.height / 22.4,
            width: 180,
            child: Text(text, style: bodyStyle, textAlign: TextAlign.start)),
      ],
    );
  }
}

class IntroductionRowWater extends StatelessWidget {
  const IntroductionRowWater({
    super.key,
    required this.image,
    required this.text,
  });
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: SizedBox(
              height: Get.height / 9.6, width: 70, child: imageOpacity(image)),
        ),
        const SizedBox(width: 20),
        SizedBox(
            height: Get.height / 22.4,
            width: 180,
            child: Text(text, style: bodyStyle, textAlign: TextAlign.start)),
      ],
    );
  }
}
