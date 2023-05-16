import 'package:flutter/material.dart';
import '../../IntroductionScreen/Widgets/introduction_pages.dart';

class BottomSheetButton extends StatelessWidget {
  const BottomSheetButton(
      {super.key,
      required this.onPressed,
      required this.buttonText,
      required this.buttonBgColor});

  final void Function() onPressed;

  final String buttonText;
  final Color? buttonBgColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: buttonBgColor),
        onPressed: () {
          onPressed();
        },
        child: Text(buttonText, style: bodyStyle));
  }
}
