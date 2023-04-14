import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

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
                    child: Text(
                        '${(widget.totalCo2 / 1000).toStringAsFixed(2)}\nTon',
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        textAlign: TextAlign.center),
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
            const SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Indicator(color: Colors.yellow, text: 'Elektrik Tüketimi'),
                SizedBox(height: 4),
                Indicator(color: Colors.blue, text: 'Isınma Değerleri'),
                SizedBox(height: 4),
                Indicator(color: Colors.red, text: 'Yakıt Tüketimi'),
                SizedBox(height: 4),
                Indicator(color: Colors.green, text: 'Yiyecek Tüketimi'),
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
            color: Colors.yellow[700],
            value: electric,
            title: '%${electric.toStringAsFixed(0)}',
            radius: 50,
            titleStyle: circleTextStyle(),
          );
        case 1:
          return PieChartSectionData(
              color: Colors.blue[700],
              value: warming,
              title: '%${warming.toStringAsFixed(0)}',
              radius: 50,
              titleStyle: circleTextStyle());
        case 2:
          return PieChartSectionData(
              color: Colors.red[700],
              value: fuel,
              title: '%${fuel.toStringAsFixed(0)}',
              radius: 50,
              titleStyle: circleTextStyle());
        case 3:
          return PieChartSectionData(
              color: Colors.green[700],
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
