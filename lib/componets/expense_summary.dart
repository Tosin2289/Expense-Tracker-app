import 'package:expense_tracker/bar%20graph/bar_graph.dart';
import 'package:expense_tracker/data/expense_data.dart';
import 'package:expense_tracker/datetime/date_time_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpenseSummary extends StatelessWidget {
  final startOfWeek;
  const ExpenseSummary({Key? key, required this.startOfWeek}) : super(key: key);
//Calculate the max amount on the bar graph
  double calculateMax(
      ExpenseData value,
      String sunday,
      String monday,
      String tueday,
      String wenesday,
      String thurday,
      String friday,
      String saturday) {
    double? max = 100;
    List<double> values = [
      value.calcuateDailyExpenseSummary()[sunday] ?? 0,
      value.calcuateDailyExpenseSummary()[monday] ?? 0,
      value.calcuateDailyExpenseSummary()[tueday] ?? 0,
      value.calcuateDailyExpenseSummary()[wenesday] ?? 0,
      value.calcuateDailyExpenseSummary()[thurday] ?? 0,
      value.calcuateDailyExpenseSummary()[friday] ?? 0,
      value.calcuateDailyExpenseSummary()[saturday] ?? 0,
    ];
    values.sort();
    max = values.last * 1.1;
    return max == 0 ? 100 : max;
  }

  String calculateWeekTotal(
      ExpenseData value,
      String sunday,
      String monday,
      String tueday,
      String wenesday,
      String thurday,
      String friday,
      String saturday) {
    List<double> values = [
      value.calcuateDailyExpenseSummary()[sunday] ?? 0,
      value.calcuateDailyExpenseSummary()[monday] ?? 0,
      value.calcuateDailyExpenseSummary()[tueday] ?? 0,
      value.calcuateDailyExpenseSummary()[wenesday] ?? 0,
      value.calcuateDailyExpenseSummary()[thurday] ?? 0,
      value.calcuateDailyExpenseSummary()[friday] ?? 0,
      value.calcuateDailyExpenseSummary()[saturday] ?? 0,
    ];
    double total = 0;
    for (int i = 0; i < values.length; i++) {
      total += values[i];
    }
    return total.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    //get yyyymmdd for each day of this week
    String sunday = convertDateTimeToString(startOfWeek.add(Duration(days: 0)));
    String monday = convertDateTimeToString(startOfWeek.add(Duration(days: 1)));
    String tueday = convertDateTimeToString(startOfWeek.add(Duration(days: 2)));
    String wenesday =
        convertDateTimeToString(startOfWeek.add(Duration(days: 3)));
    String thurday =
        convertDateTimeToString(startOfWeek.add(Duration(days: 4)));
    String friday = convertDateTimeToString(startOfWeek.add(Duration(days: 5)));
    String saturday =
        convertDateTimeToString(startOfWeek.add(Duration(days: 6)));

    return Consumer<ExpenseData>(
      builder: (context, value, child) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              children: [
                Text(
                  "Week Total :",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("₦" +
                    calculateWeekTotal(value, sunday, monday, tueday, wenesday,
                        thurday, friday, saturday)),
              ],
            ),
          ),
          SizedBox(
            height: 200,
            child: MyBarGraph(
                maxY: calculateMax(value, sunday, monday, tueday, wenesday,
                    thurday, friday, saturday),
                sunAmount: value.calcuateDailyExpenseSummary()[sunday] ?? 0,
                monAmount: value.calcuateDailyExpenseSummary()[monday] ?? 0,
                tueAmount: value.calcuateDailyExpenseSummary()[tueday] ?? 0,
                wenAmount: value.calcuateDailyExpenseSummary()[wenesday] ?? 0,
                thurAmount: value.calcuateDailyExpenseSummary()[thurday] ?? 0,
                friAmount: value.calcuateDailyExpenseSummary()[friday] ?? 0,
                satAmount: value.calcuateDailyExpenseSummary()[saturday] ?? 0),
          ),
        ],
      ),
    );
  }
}
