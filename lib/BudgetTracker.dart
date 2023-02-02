import 'Transaction.dart';

class BudgetTracker {
  final List<Transaction> _transactions = [];

  void add(Transaction transaction) {
    _transactions.add(transaction);
  }

  get() => _transactions;

  List<Transaction> getTransactionsByCategory(String category) =>
      _transactions.where((element) => element.category == category).toList();

  double totalExpenses() {
    return _transactions
        .map((e) => e.amount)
        .reduce((value, element) => value + element);
  }
}
