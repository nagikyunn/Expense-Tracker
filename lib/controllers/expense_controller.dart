import 'package:expense_trackerproj/models/expenses.dart';

class ExpenseController {
  double _initialBalance = 1000.00;

  final List<Expense> _expenses = [];

  final List<String> categories = [
    'Food',
    'Transportation',
    'Utilities',
    'Personal Use',
  ];

  List<Expense> get expenses => _expenses;

  double get initialBalance => _initialBalance;

  double get totalBalance {
    double totalSpent = 0.0;
    for (var item in _expenses) {
      totalSpent += item.amount;
    }
    return _initialBalance - totalSpent;
  }

  void setInitialBalance(double amount) {
    _initialBalance = amount;
  }

  void addFunds(double amount) {
    _initialBalance += amount;
  }

  void addExpense(Expense expense) {
    _expenses.add(expense);
  }

  void deleteExpense(String id) {
    _expenses.removeWhere((item) => item.id == id);
  }

  double getTotalByCategory(String category) {
    double total = 0.0;
    for (var item in _expenses) {
      if (item.category == category) {
        total += item.amount;
      }
    }
    return total;
  }
}
