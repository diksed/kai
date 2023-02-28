import 'package:flutter/material.dart';
import 'package:kai/Utils/app_colors.dart';
import 'package:kai/Utils/app_texts.dart';

Widget nextButton(bool onLastPage) {
  return onLastPage
      ? SizedBox(
          height: 50,
          width: 200,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              enableFeedback: false,
              foregroundColor: Colors.white,
              backgroundColor: AppColors.dotColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Hadi Başlayalım',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
            ),
          ),
        )
      : SizedBox(
          height: 40,
          width: 100,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              enableFeedback: false,
              foregroundColor: Colors.white,
              backgroundColor: AppColors.dotColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              DefaultTexts.next,
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
            ),
          ),
        );
}
