import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    
    final sortedExpenses = List<Expense>.from(expenses)
    ..sort((a, b) => b.date.compareTo(a.date)); // du plus récent au plus ancien


    return ListView.builder(
      itemCount: sortedExpenses.length,
      itemBuilder:
          (ctx, index) => Dismissible(
            key: ValueKey(sortedExpenses[index]),
            onDismissed: (direction) {
              onRemoveExpense(sortedExpenses[index]);
            },
            child: ExpenseItem(sortedExpenses[index]),
          ),
    );
  }
}
