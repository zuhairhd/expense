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
