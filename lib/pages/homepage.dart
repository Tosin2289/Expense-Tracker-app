import 'package:expense_tracker/componets/expense_summary.dart';
import 'package:expense_tracker/componets/expense_tile.dart';
import 'package:expense_tracker/data/expense_data.dart';
import 'package:expense_tracker/models/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //text controllers
  final newExpenseNameContoller = TextEditingController();
  final newExpenseAmountContoller = TextEditingController();
  //add new expense
  void addNewExpense() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Add new Expense"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: newExpenseNameContoller,
                  ),
                  TextField(
                    controller: newExpenseAmountContoller,
                  ),
                ],
              ),
              actions: [
                //save button
                MaterialButton(
                  onPressed: save,
                  child: Text("Save"),
                ),
                //Cancle button

                MaterialButton(
                  onPressed: cancel,
                  child: Text("Cancel"),
                )
              ],
            ));
  }

//save
  void save() {
    //create Expense item
    ExpenseItem newExpense = ExpenseItem(
      name: newExpenseNameContoller.text,
      amount: newExpenseAmountContoller.text,
      dateTime: DateTime.now(),
    );
//add new Expense
    Provider.of<ExpenseData>(context, listen: false).addNewExpense(newExpense);
    Navigator.pop(context);
    clear();
  }

//cancel
  void cancel() {
    Navigator.pop(context);
    clear();
  }

//clear controllers
  void clear() {
    newExpenseNameContoller.clear();
    newExpenseAmountContoller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
        builder: (context, value, child) => Scaffold(
            backgroundColor: Colors.grey[300],
            floatingActionButton: FloatingActionButton(
              onPressed: addNewExpense,
              child: Icon((Icons.add)),
            ),
            body: ListView(
              children: [
                //weekly summary
                ExpenseSummary(startOfWeek: value.startOfTheWeek()),
                //Expense list
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: value.getAllExpenseList().length,
                  itemBuilder: ((context, index) => ExpenseTile(
                      name: value.getAllExpenseList()[index].name,
                      amount: value.getAllExpenseList()[index].amount,
                      date: value.getAllExpenseList()[index].dateTime)),
                ),
              ],
            )));
  }
}
