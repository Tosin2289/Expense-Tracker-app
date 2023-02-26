import 'package:expense_tracker/bar%20graph/bar_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyBarGraph extends StatelessWidget {
  final double? maxY;
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wenAmount;
  final double thurAmount;
  final double friAmount;
  final double satAmount;
  MyBarGraph(
      {Key? key,
      required this.maxY,
      required this.sunAmount,
      required this.monAmount,
      required this.tueAmount,
      required this.wenAmount,
      required this.thurAmount,
      required this.friAmount,
      required this.satAmount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
        sunAmount: sunAmount,
        monAmount: monAmount,
        tueAmount: tueAmount,
        wenAmount: wenAmount,
        thurAmount: thurAmount,
        friAmount: friAmount,
        satAmount: satAmount);
    myBarData.intializeBarData();
    return BarChart(
      BarChartData(
          maxY: maxY,
          minY: 0,
          barGroups: myBarData.barData
              .map((data) => BarChartGroupData(x: data.x, barRods: [
                    BarChartRodData(
                      toY: data.y,
                    )
                  ]))
              .toList()),
    );
  }
}