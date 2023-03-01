import 'package:expense_tracker/bar%20graph/bar_graph.dart';
import 'package:expense_tracker/data/expense_data.dart';
import 'package:expense_tracker/datetime/date_time_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpenseSummary extends StatelessWidget {
  final startOfWeek;
  const ExpenseSummary({Key? key, required this.startOfWeek}) : super(key: key);

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
      builder: (context, value, child) => SizedBox(
        height: 200,
        child: MyBarGraph(
            maxY: 100,
            sunAmount: value.calcuateDailyExpenseSummary()[sunday] ?? 0,
            monAmount: value.calcuateDailyExpenseSummary()[monday] ?? 0,
            tueAmount: value.calcuateDailyExpenseSummary()[tueday] ?? 0,
            wenAmount: value.calcuateDailyExpenseSummary()[wenesday] ?? 0,
            thurAmount: value.calcuateDailyExpenseSummary()[thurday] ?? 0,
            friAmount: value.calcuateDailyExpenseSummary()[friday] ?? 0,
            satAmount: value.calcuateDailyExpenseSummary()[saturday] ?? 0),
      ),
    );
  }
}
