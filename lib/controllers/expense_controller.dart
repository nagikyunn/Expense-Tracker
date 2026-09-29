import '/models/expenses.dart';

class ExpenseController {
  double balance = 0.0;
  final List<Expense> expenses = [];

  // Total spent combined from all expenses
  double get totalSpent {
    double sum = 0.0;
    for (var item in expenses) {
      sum += item.amount;
    }
    return sum;
  }

  // Add money to balance
  void addFunds(double amount) {
    balance += amount;
  }

  // Deduct from balance and log expense
  void addExpense(ExpensesCategory category, double amount) {
    if (balance >= amount) {
      balance -= amount;
      expenses.add(
        Expense(
          id: DateTime.now().toString(),
          category: category,
          amount: amount,
        ),
      );
    }
  }
}
