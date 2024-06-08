import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:expnses_ex/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  List<Expense> _expenses = [
     Expense(title: 'Shoes', 
     amount: 69.99, 
     date: DateTime.now(),
     category:),

    // Expenses(title: 'Groceries', amount: 16.53, date: DateTime.now()),
    // Expenses(title: 'Books', amount: 45.87, date: DateTime.now()),
  ];  // List of expenses
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Expenses'),
      ),
      body: const Center(
        child: Column(
          children: [
            Text('Expenses chart will be here'),
            Text('Expenses list will be here'),
          ],
        ),
      ),
    );
  }
}