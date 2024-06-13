import 'package:expnses_ex/widget/add_expense.dart';
import 'package:expnses_ex/widget/expense_list/expenses_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:expnses_ex/models/expense.dart';
import 'package:expnses_ex/models/Account.dart';
// import 'package:expnses_ex/models/def-category.dart' as exCategory;
// import 'package:expnses_ex/models/def-category.dart' show Category; // Specify the correct import for Category class

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  // List of expenses
  void _addExpense(Expense expense) {
    setState(() {
      _expenses.add(expense);
    });
  }

  removeAt(int index) {
    setState(() {
      _expenses.removeAt(index);
    });
  ScaffoldMessenger.of(context).showSnackBar(
     SnackBar(
      content: const Text('Expense removed'),
      duration: const Duration(seconds: 2),
      action: SnackBarAction(
        label: 'UNDO',
        onPressed: () {
          setState(() {
            _expenses.insert(index, _expenses[index]);
          });
        },
      ),

      // +++++++++++++++++++++++++++
    ),
  );

  }

  final List<Expense> _expenses = [
    Expense(
      title: 'Pay monthly Mazin expenses',
      amount: 150.00,
      date: DateTime.now(),
      category: Account.children,
    ),
    Expense(
      title: 'Pay monthly Motaz expenses',
      amount: 150.00,
      date: DateTime.now(),
      category: Account.children,
    ),
    Expense(
      title: 'Pay monthly Mohanid expenses',
      amount: 150.00,
      date: DateTime.now(),
      category: Account.children,
    ),
    Expense(
      title: 'Pay monthly Majed expenses',
      amount: 150.00,
      date: DateTime.now(),
      category: Account.children,
    ),
    Expense(
      title: 'Pay monthly Yousif expenses',
      amount: 150.00,
      date: DateTime.now(),
      category: Account.children,
    ),
    Expense(
      title: 'Monthly Food Expenses',
      amount: 370.00,
      date: DateTime.now(),
      category: Account.food,
    ),
    Expense(
      title: 'Pay Visa OAB',
      amount: 50,
      date: DateTime.now(),
      category: Account.loans,
    ),
    Expense(
      title: 'Pay Visa OAB',
      amount: 200,
      date: DateTime.now(),
      category: Account.loans,
    ),
    Expense(
      title: 'Pay MasterCard Alizz',
      amount: 120,
      date: DateTime.now(),
      category: Account.loans,
    ),
    Expense(
      title: 'Internet Bill',
      amount: 80,
      date: DateTime.now(),
      category: Account.bills,
    ),
    Expense(
      title: 'Ansab Electricity Bill',
      amount: 50,
      date: DateTime.now(),
      category: Account.bills,
    ),
    Expense(
      title: 'Ansab water Bill',
      amount: 30,
      date: DateTime.now(),
      category: Account.bills,
    ),
    Expense(
      title: 'Alkhwair Electricity Bill',
      amount: 50,
      date: DateTime.now(),
      category: Account.bills,
    ),
    Expense(
      title: 'Alkhwair water Bill',
      amount: 30,
      date: DateTime.now(),
      category: Account.bills,
    ),
    Expense(
      title: 'GSM Bill',
      amount: 30,
      date: DateTime.now(),
      category: Account.bills,
    )
  ];
  //     category: Category.clothing,)];
  //     category: exCategory.Category.clothing,
  //   ),
  // ];
  void _openAddExpenseDialog() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => AddExpense(_addExpense));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Text('No expenses added yet!');
    if (_expenses.isNotEmpty) {
      mainContent = Expanded(
        child: ExpensesList(
          expenses: _expenses,
          removeAt: removeAt,
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _openAddExpenseDialog,
            // onPressed: () {

            //   // Add new expense
            //   // setState(() {
            //   //   _expenses.add(
            //   //     Expense(
            //   //       title: 'New Expense',
            //   //       amount: 100.00,
            //   //       date: DateTime.now(),
            //   //       category: Account.children,
            //   //     ),
            //   //   );
            //   // });
            // },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Expenses chart will be here'),
            mainContent,
          ],
        ),
      ),
    );
  }
}
