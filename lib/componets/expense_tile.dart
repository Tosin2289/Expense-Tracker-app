import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ExpenseTile extends StatelessWidget {
  final String name;
  final DateTime date;
  final String amount;
  void Function(BuildContext)? deleteTapped;
  ExpenseTile(
      {Key? key,
      required this.name,
      required this.amount,
      required this.date,
      required this.deleteTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(motion: StretchMotion(), children: [
        SlidableAction(
          onPressed: deleteTapped,
          icon: Icons.delete,
          backgroundColor: Colors.red,
          borderRadius: BorderRadius.circular(4),
        ),
      ]),
      child: ListTile(
        title: Text(name),
        subtitle: Text(date.day.toString() +
            '/' +
            date.month.toString() +
            '/' +
            date.year.toString()),
        trailing: Text('₦' + amount),
      ),
    );
  }
}
