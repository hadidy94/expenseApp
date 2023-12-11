import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;
  final Function(Expense expense) onRemoveExpense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[index]),
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },
        background: Container(
          padding: const EdgeInsets.only(right: 20.0),
          color: Theme.of(context).colorScheme.error.withOpacity(0.75),
          margin: const EdgeInsets.all(16),
          child: const Align(
            alignment: Alignment.centerRight,
            child: Text('Delete',
                textAlign: TextAlign.right,
                style: TextStyle(color: Colors.white)),
          ),
        ),
        child: ExpenseItem(expenses[index]),
      ),
      itemCount: expenses.length,
    );
  }
}
