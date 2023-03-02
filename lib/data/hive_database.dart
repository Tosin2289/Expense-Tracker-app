import 'package:hive_flutter/hive_flutter.dart';

import '../models/expense_item.dart';

class HiveDataBase {
//reference our box
  final _mybox = Hive.box("expense_database");
//write data
  void saveData(List<ExpenseItem> allExpense) {
    List<List<dynamic>> allExpensesFormatted = [];

    for (var expense in allExpense) {
      List<dynamic> expenseFormatted = [
        expense.name,
        expense.amount,
        expense.dateTime,
      ];
      allExpensesFormatted.add(expenseFormatted);
    }
    //store in database
    _mybox.put("All_EXPENSES", allExpensesFormatted);
  }

//read data
  List<ExpenseItem> readData() {
    List savedExpenses = _mybox.get("All_EXPENSES") ?? [];
    List<ExpenseItem> allExpenses = [];
    for (int i = 0; i < savedExpenses.length; i++) {
      String name = savedExpenses[i][0];
      String amount = savedExpenses[i][1];
      DateTime dateTime = savedExpenses[i][2];
      ExpenseItem expense =
          ExpenseItem(name: name, amount: amount, dateTime: dateTime);
      allExpenses.add(expense);
    }
    return allExpenses;
  }
}
