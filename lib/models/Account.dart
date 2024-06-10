import 'package:flutter/material.dart';

enum Account {
  food,
  personal,
  children,
  loans,
  bills,
  clothing,
  entertainment,
  transport,
  miscellaneous
}

const accountNames = {
  Account.food: 'Food',
  Account.personal: 'Personal',
  Account.children: 'Children',
  Account.loans: 'Loans',
  Account.bills: 'Bills',
  Account.clothing: 'Clothing',
  Account.entertainment: 'Entertainment',
  Account.transport: 'Transport',
  Account.miscellaneous: 'Miscellaneous',
};

const accountIcons = {
  Account.food: Icons.fastfood,
  Account.personal: Icons.person,
  Account.children: Icons.child_friendly,
  Account.loans: Icons.money,
  Account.bills: Icons.receipt,
  Account.clothing: Icons.shopping_bag,
  Account.entertainment: Icons.movie,
  Account.transport: Icons.directions_bus,
  Account.miscellaneous: Icons.category,
};
