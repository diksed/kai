import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kai/Utils/app_texts.dart';
import '../../../../Utils/app_colors.dart';

class ElectricDropdownMenu extends StatelessWidget {
  const ElectricDropdownMenu({super.key, required this.electricSelectedType});
  final RxString electricSelectedType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height / 11.2,
      width: Get.width / 4.525,
      child: Obx(
        () => DropdownButton(
          icon:
              const Icon(Icons.keyboard_arrow_down_sharp, color: Colors.white),
          iconSize: 30,
          elevation: 20,
          style: const TextStyle(color: Colors.white, fontSize: 20),
          underline: Container(height: 0),
          dropdownColor: AppColors.indicatorBackground,
          borderRadius: BorderRadius.circular(15),
          itemHeight: Get.height / 11.2,
          value: electricSelectedType.value,
          onChanged: (newValue) {
            electricSelectedType.value = newValue!;
          },
          items: <String>[KeyTexts.kWh, KeyTexts.tl]
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
