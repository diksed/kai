import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Indicator extends StatelessWidget {
  const Indicator(
      {super.key,
      required this.color,
      required this.text,
      this.size = 16,
      this.textColor});
  final Color color;
  final String text;

  final double size;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
        SizedBox(width: Get.width / 90),
        Text(
          text,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
        )
      ],
    );
  }
}
