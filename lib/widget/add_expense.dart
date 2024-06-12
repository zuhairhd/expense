import 'package:expnses_ex/models/Account.dart';
import 'package:expnses_ex/models/expense.dart';
import 'package:flutter/material.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  // Define your state variables here

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Account _selectedAccount = Account.children;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstdate = DateTime(now.year - 1, now.month, now.day);
    final lastdate = DateTime(now.year + 1, now.month, now.day);

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstdate,
      lastDate: lastdate,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _showAlertDialog({required String title,required String content}) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text('Okay'),
          ),
        ],
      ),
    );
  }

  _submitExpenseData() {
    final double enteredAmount;
    try {
       enteredAmount = double.parse(_amountController.text);
    } catch (e) {
      // show an alert dialog here
      _showAlertDialog(title: 'Invalid Amount', content: 'Please enter a valid amount');
      return;    
    }
    final amountIsValid =  enteredAmount > 0;
    final titleIsValid = _titleController.text.trim().isNotEmpty;
    final dateIsValid = _selectedDate != null;
    // no need to check if the account is selected or not
    // because the default value is already selected
    // final accountIsValid = _selectedAccount != null;
    final formIsValid = amountIsValid && titleIsValid && dateIsValid ;

    if ( !formIsValid) {
          //show an alert dialog here
      _showAlertDialog(title: 'Invalid Input', content: 'Please enter valid data');
      return;
    }
    final enteredTitle = _titleController.text;
    // final enteredAmount = double.parse(_amountController.text);
    final enteredDate = _selectedDate;

    // final newExpense = Expense(
    //   id: DateTime.now().toString(),
    //   title: enteredTitle,
    //   amount: enteredAmount,
    //   date: enteredDate!,
    //   account: _selectedAccount,
    // );

    // Navigator.of(context).pop(newExpense);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(children: [
        TextField(
          controller: _titleController,
          maxLength: 50,
          decoration: const InputDecoration(labelText: 'Title'),
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _amountController,
                decoration: const InputDecoration(
                  labelText: 'Amount',
                  prefixText: 'RO ',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(width: 20),
            // add date picker here
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(_selectedDate == null
                    ? 'No Date Selected'
                    : formatedDate
                        .format(_selectedDate!)), // show the selected date here
                IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: _presentDatePicker,
                ),
              ],
            ),
          ],
        ),

        // const TextField(
        //   decoration: InputDecoration(labelText: 'Date'),
        //   keyboardType: TextInputType.datetime,
        // ),
        // DropdownButtonFormField(
        //   items: [],
        //   onChanged: (value) {},
        // ),
        const SizedBox(height: 25),
        Row(
          children: [
            DropdownButton(
              value: _selectedAccount,
              items: Account.values.map((cat) {
                return DropdownMenuItem(
                  value: cat,
                  child: Text(cat.name.toUpperCase()),
                );
              }).toList(),
              onChanged: (value) {
                // Implement the function here
                if (value == null) {
                  return;
                }
                setState(() {
                  _selectedAccount = value;
                });
              },
            ),
            const Spacer(),
             ElevatedButton(
              onPressed: () {
                // cancel the adding expense and go back to the list
                Navigator.pop(context);
              },
              child: const Text('cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                _submitExpenseData();  
                // Implement the function here
                // print(_titleController.text + ' is added');
              },
              child: const Text('Add Expense'),
            ),
          ],
        ),
      ]),
    );
  }
}
