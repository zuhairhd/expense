import 'package:flutter/material.dart';
import 'package:expnses_ex/models/expense.dart';

class ExpenseItem extends StatelessWidget {
  final Expense expense;

  ExpenseItem({required this.expense, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Text(expense.title),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${expense.amount.toStringAsFixed(3)} RO'),
              const Spacer(),
              Row(
                children: [
                  Icon(Icons.category),
                  const SizedBox(width: 10),
                  Text(expense.date.toString()),
                  // Text(expense.category.name),
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
