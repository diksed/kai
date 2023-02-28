import 'package:flutter/material.dart';
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
          height: 70,
          width: 70,
          child: Image.asset(image,
              color: Colors.white.withOpacity(0.4),
              colorBlendMode: BlendMode.modulate),
        ),
        const SizedBox(width: 40),
        SizedBox(
            height: 30,
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
            height: 70,
            width: 70,
            child: Image.asset(image,
                color: Colors.white.withOpacity(0.4),
                colorBlendMode: BlendMode.modulate),
          ),
        ),
        const SizedBox(width: 20),
        SizedBox(
            height: 30,
            width: 180,
            child: Text(text, style: bodyStyle, textAlign: TextAlign.start)),
      ],
    );
  }
}
