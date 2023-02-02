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
        .whereType<Expense>()
        .map((e) => e.amount)
        .reduce((value, element) => value + element);
  }

  double totalIncome() {
    return _transactions
        .whereType<Income>()
        .map((e) => e.amount)
        .reduce((value, element) => value + element);
  }

  void edit(id,
      [DateTime? dateTime,
      String? category,
      double? amount,
      String? description]) {
    _transactions
        .firstWhere((element) => element.id == id)
        .update(dateTime, category, amount, description);
  }
}
