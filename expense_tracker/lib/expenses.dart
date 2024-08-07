import 'package:expense_tracker/expenses_list.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 99.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 59.99,
      date: DateTime.now(),
      category: Category.leisure,
    ),
    Expense(
      title: 'Pizza',
      amount: 99.99,
      date: DateTime.now(),
      category: Category.food,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('chart'),
          Expanded(child: ExpensesList(expenses: _registeredExpenses))
        ],
      ),
    );
  }
}
