import 'Transaction.dart';

class BudgetTracker {
  final List<Transaction> _transactions = [];

  void add(Transaction transaction) {
    _transactions.add(transaction);
  }

  get() => _transactions;

  List<Transaction> getTransactionsByCategory(String category) {
    return [];

  }
}
