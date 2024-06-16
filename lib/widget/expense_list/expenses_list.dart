import 'package:expnses_ex/widget/expense_list/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expnses_ex/models/expense.dart';

// import 'expenses.dart';

class ExpensesList extends StatelessWidget {
  final List<Expense> expenses;
  final void Function(int) removeAt;

  const ExpensesList({super.key, required this.expenses, required this.removeAt});

  @override
  Widget build(BuildContext context) {
    // add scroll view the listview

    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        Expense expense = expenses[index];
        return Dismissible(
          background: Container(
            color: Theme.of(context).colorScheme.error,
            child: const Icon(Icons.delete, color: Colors.white, size: 40,),
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20),
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 4,
            ),
          ),
          onDismissed: (direction) {
            removeAt(index);            
          },
          key: ValueKey(expense),
          child: ExpenseItem(expense: expense),
        );
      },
    );
  }
}
