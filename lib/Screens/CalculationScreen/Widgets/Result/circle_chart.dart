import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kai/Utils/app_texts.dart';

import 'circle_indicator.dart';
import 'circle_text_style.dart';

class CircleGraphic extends StatefulWidget {
  const CircleGraphic(
      {super.key,
      required this.totalCo2,
      required this.electricResult,
      required this.warmingResult,
      required this.fuelResult,
      required this.foodResult});

  @override
  State<StatefulWidget> createState() => CircleGraphicState();
  final double totalCo2;
  final double electricResult;
  final double warmingResult;
  final double fuelResult;
  final double foodResult;
}

class CircleGraphicState extends State<CircleGraphic> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: Center(
        child: Row(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(right: Get.width / 78.4),
                      child: Text(
                          '${(widget.totalCo2 / 1000).toStringAsFixed(2)}\nTon',
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          textAlign: TextAlign.center),
                    ),
                  ),
                  AspectRatio(
                    aspectRatio: 1,
                    child: PieChart(
                      PieChartData(
                          borderData: FlBorderData(
                            show: false,
                          ),
                          startDegreeOffset: 120,
                          sectionsSpace: 0,
                          centerSpaceRadius: 40,
                          sections: showingSections(
                              (widget.electricResult * 100 / widget.totalCo2),
                              (widget.warmingResult * 100 / widget.totalCo2),
                              (widget.fuelResult * 100 / widget.totalCo2),
                              (widget.foodResult * 100 / widget.totalCo2))),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: Get.width / 18),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Indicator(
                    color: Color.fromRGBO(251, 192, 45, 1),
                    text: IntroductionText.electricConsumption),
                SizedBox(height: Get.height / 168),
                const Indicator(
                    color: Color.fromRGBO(25, 118, 210, 1),
                    text: IntroductionText.warmingValues),
                SizedBox(height: Get.height / 168),
                const Indicator(
                    color: Color.fromRGBO(211, 47, 47, 1),
                    text: IntroductionText.fuelConsumption),
                SizedBox(height: Get.height / 168),
                const Indicator(
                    color: Color.fromARGB(255, 54, 81, 56),
                    text: IntroductionText.foodConsumption),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections(
      double electric, double warming, double fuel, double food) {
    return List.generate(4, (i) {
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color.fromRGBO(251, 192, 45, 1),
            value: electric,
            title: '%${electric.toStringAsFixed(0)}',
            radius: 50,
            titleStyle: circleTextStyle(),
          );
        case 1:
          return PieChartSectionData(
              color: const Color.fromRGBO(25, 118, 210, 1),
              value: warming,
              title: '%${warming.toStringAsFixed(0)}',
              radius: 50,
              titleStyle: circleTextStyle());
        case 2:
          return PieChartSectionData(
              color: const Color.fromRGBO(211, 47, 47, 1),
              value: fuel,
              title: '%${fuel.toStringAsFixed(0)}',
              radius: 50,
              titleStyle: circleTextStyle());
        case 3:
          return PieChartSectionData(
              color: const Color.fromARGB(255, 54, 81, 56),
              value: food,
              title: '%${food.toStringAsFixed(0)}',
              radius: 50,
              titleStyle: circleTextStyle());
        default:
          throw Error();
      }
    });
  }
}
