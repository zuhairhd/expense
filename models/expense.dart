import 'package:uuid/uuid.dart';
// create a new instance of Uuid
const uuid = Uuid();

enum Category{
  food,
  transport,
  chillderen,
  loans,
  bills,
  suad,
  others
}

class Expense{
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
  Expense({required this.title, required this.amount, required this.date,required this.category}):id = uuid.v4();

}