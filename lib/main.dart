import 'package:flutter/material.dart';
import 'package:expnses_ex/widget/expenses.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        ),
      home: const Expenses(),
    ),
  );
}