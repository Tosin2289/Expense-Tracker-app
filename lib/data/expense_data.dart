import 'package:expense_tracker/datetime/date_time_helper.dart';

import '../models/expense_item.dart';

class ExpenseData {
  // list of all expense
  List<ExpenseItem> overallExpenseList = [];
// get expense list
  List<ExpenseItem> getAllExpenseList() {
    return overallExpenseList;
  }

// add new expense
  void addNewExpense(ExpenseItem newExpense) {
    overallExpenseList.add(newExpense);
  }

// delete expense
  void deleteExpense(ExpenseItem expense) {
    overallExpenseList.remove(expense);
  }

// get weekday
  String getDayName(DateTime dateTime) {
    switch (dateTime.weekday) {
      case 1:
        return 'mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wen';
      case 4:
        return 'Thur';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
        break;
      default:
        return ' ';
    }
  }

// get the date for the start of the week
  DateTime startOfTheWeek() {
    DateTime? startOfTheWeek;

    // get todays date

    DateTime today = DateTime.now();
    //go backwards from today to find sunday
    for (int i = 0; i < 7; i++) {
      if (getDayName(today.subtract(Duration(days: i))) == 'sun') {
        startOfTheWeek = today.subtract(Duration(days: i));
      }
    }
    return startOfTheWeek!;
  }

  //convert overll list of expense into a daily expanse summary
  Map<String, double> calcuateDailyExpenseSummary() {
    Map<String, double> dailyExpenseSummary = {};
    for (var expanse in overallExpenseList) {
      String date = convertDateTimeToString(expanse.dateTime);
      double amount = double.parse(expanse.amount);
      if (dailyExpenseSummary.containsKey(date)) {
        double currentAmount = dailyExpenseSummary[date]!;
        currentAmount += amount;
        dailyExpenseSummary[date] = currentAmount;
      } else {
        dailyExpenseSummary.addAll({date: amount});
      }
    }
    return dailyExpenseSummary;
  }
}
