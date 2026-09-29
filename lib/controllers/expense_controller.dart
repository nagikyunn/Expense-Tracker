import '../models/expenses.dart';

class ExpenseController {
  double currentBalance = 0.0;
  double totalSpent = 0.0;

  double foodTotal = 0.0;
  double transpoTotal = 0.0;
  double utilitiesTotal = 0.0;
  double personalTotal = 0.0;

  void addFunds(double amount) {
    currentBalance += amount;
  }

  void addExpense(ExpensesCategory category, double amount) {
    if (currentBalance >= amount) {
      currentBalance -= amount;
      totalSpent += amount;

      if (category == ExpensesCategory.food) {
        foodTotal += amount;
      } else if (category == ExpensesCategory.transpo) {
        transpoTotal += amount;
      } else if (category == ExpensesCategory.util) {
        utilitiesTotal += amount;
      } else if (category == ExpensesCategory.personalUse) {
        personalTotal += amount;
      }
    }
  }
}
