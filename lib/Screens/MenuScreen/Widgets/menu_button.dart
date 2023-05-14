import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kai/Utils/app_colors.dart';

class MenuButton extends StatelessWidget {
  const MenuButton(
      {super.key,
      required this.text,
      required this.image,
      required this.onTap});

  final String text;
  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: Get.width / 2.117,
        height: Get.height / 11.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(image,
                width: Get.width / 8, height: Get.height / 14.933),
            Text(
              text,
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.backgroundColor,
                  fontSize: 19),
            )
          ],
        ),
      ),
    );
  }
}
