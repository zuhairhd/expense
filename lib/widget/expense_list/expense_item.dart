import 'package:expnses_ex/models/Account.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(expense.title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${expense.amount.toStringAsFixed(3)} RO', style: Theme.of(context).textTheme.titleSmall),
              const Spacer(),
              Row(
                children: [
                  Icon(accountIcons[expense.category]),
                  const SizedBox(width: 10),
                  Text(expense.formattedDate, style: Theme.of(context).textTheme.titleSmall),
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
