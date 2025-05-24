import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/expenses_list.dart';
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
    Expense(title: 'Water', amount: 2, date: DateTime.now(), category: Category.food),
    Expense(title: 'Cinema', amount: 15, date: DateTime.now(), category: Category.leisure)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('The chart'), 
            Expanded(child: ExpensesList(expenses: _registeredExpenses))
            ],
        ),
      ),
    );
  }
}
