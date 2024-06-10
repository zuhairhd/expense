import 'package:expnses_ex/models/Account.dart';
// import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
// import 'package:expnses_ex/models/def-category.dart' show Category; // Specify the correct import for Category class
// create a new instance of Uuid
const uuid = Uuid();
final formatedDate = DateFormat.yMMMd();
// Create a new class called Expense
class Expense{
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  // final Category category;
  // final Category category;
  final Account category;
  Expense({required this.title, required this.amount, required this.date, required this.category}):id = uuid.v4();

 String get formattedDate {
    return formatedDate.format(date);
  }
}