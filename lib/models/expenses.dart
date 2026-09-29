enum ExpensesCategory { food, transpo, util, personalUse }

class Expense {
  final String id;
  final ExpensesCategory category;
  final double amount;

  Expense({required this.id, required this.category, required this.amount});

  String get categoryName {
    switch (category) {
      case ExpensesCategory.food:
        return 'Food';
      case ExpensesCategory.transpo:
        return 'Transportation';
      case ExpensesCategory.util:
        return 'Utilities';
      case ExpensesCategory.personalUse:
        return 'Personal Use';
    }
  }
}
