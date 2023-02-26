import 'package:expense_tracker/bar%20graph/bar_graph.dart';
import 'package:expense_tracker/data/expense_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpenseSummary extends StatelessWidget {
  final startOfWeek;
  const ExpenseSummary({Key? key, required this.startOfWeek}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
      builder: (context, value, child) => SizedBox(
        height: 200,
        child: MyBarGraph(
            maxY: 100,
            sunAmount: 10,
            monAmount: 50,
            tueAmount: 85,
            wenAmount: 20,
            thurAmount: 60,
            friAmount: 70,
            satAmount: 100),
      ),
    );
  }
}
