import 'package:expense_trackerproj/controllers/expense_controller.dart';
import 'package:expense_trackerproj/models/expenses.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ExpenseController expenseController = ExpenseController();

  final TextEditingController fundController = TextEditingController();
  final TextEditingController expenseControllerInput = TextEditingController();

  ExpensesCategory selectedCategory = ExpensesCategory.food;

  void _addFunds() {
    final double? amount = double.tryParse(fundController.text);
    if (amount != null && amount > 0) {
      setState(() {
        expenseController.addFunds(amount);
      });
      fundController.clear();
    }
  }

  void _addExpense() {
    final double? amount = double.tryParse(expenseControllerInput.text);
    if (amount != null && amount > 0) {
      setState(() {
        expenseController.addExpense(selectedCategory, amount);
      });
      expenseControllerInput.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              color: const Color.fromARGB(255, 146, 7, 158),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Total Balance',
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '₱${expenseController.currentBalance.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Total Spent: ₱${expenseController.totalSpent.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              color: Colors.grey[200],
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Food Total: ₱${expenseController.foodTotal.toStringAsFixed(2)}',
                    ),
                    Text(
                      'Transpo Total: ₱${expenseController.transpoTotal.toStringAsFixed(2)}',
                    ),
                    Text(
                      'Utilities Total: ₱${expenseController.utilitiesTotal.toStringAsFixed(2)}',
                    ),
                    Text(
                      'Personal Total: ₱${expenseController.personalTotal.toStringAsFixed(2)}',
                    ),

                    const SizedBox(height: 15),

                    TextField(
                      controller: fundController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Add Balance',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: _addFunds,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 146, 7, 158),
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Add Funds'),
                    ),

                    const SizedBox(height: 15),

                    DropdownButton<ExpensesCategory>(
                      value: selectedCategory,
                      isExpanded: true,
                      items: const [
                        DropdownMenuItem(
                          value: ExpensesCategory.food,
                          child: Text('Food'),
                        ),
                        DropdownMenuItem(
                          value: ExpensesCategory.transpo,
                          child: Text('Transpo'),
                        ),
                        DropdownMenuItem(
                          value: ExpensesCategory.util,
                          child: Text('Utilities'),
                        ),
                        DropdownMenuItem(
                          value: ExpensesCategory.personalUse,
                          child: Text('Personal'),
                        ),
                      ],
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            selectedCategory = value;
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: expenseControllerInput,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Expense Amount',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: _addExpense,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 146, 7, 158),
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Deduct Expense'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
