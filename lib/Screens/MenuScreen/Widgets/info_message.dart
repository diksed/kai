import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoMessage extends StatelessWidget {
  const InfoMessage({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      height: Get.height / 13.44,
      width: Get.width / 1.028,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Icon(Icons.info_outline, color: Colors.white),
          SizedBox(
            width: Get.width / 1.2,
            child: Text(text, style: const TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
