import 'package:flutter/material.dart';

class ExpenseTile extends StatelessWidget {
  final String name;
  final DateTime date;
  final String amount;
  ExpenseTile(
      {Key? key, required this.name, required this.amount, required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      subtitle: Text(date.day.toString() +
          '/' +
          date.month.toString() +
          '/' +
          date.year.toString()),
      trailing: Text('₦' + amount),
    );
  }
}
