import 'package:uuid/uuid.dart';
// create a new instance of Uuid
const uuid = Uuid();

class Expense{
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  Expense({required this.title, required this.amount, required this.date}):id = uuid.v4();

}