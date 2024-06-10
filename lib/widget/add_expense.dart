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
                Text(_selectedDate == null ? 'No Date Selected' : formatedDate.format(_selectedDate!)) , // show the selected date here
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
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                // cancel the adding expense and go back to the list
                Navigator.pop(context);

              },
              child: const Text('cancel'),
            ),
            ElevatedButton(
              onPressed: () {
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
