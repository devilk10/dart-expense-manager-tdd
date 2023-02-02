class Transaction {
  final DateTime date;
  final double amount;
  final String description;
  final String category;

  Transaction(this.date, this.category, this.amount, this.description);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    final Transaction otherTransaction = other as Transaction;
    return description == otherTransaction.description &&
        category == otherTransaction.category &&
        amount == otherTransaction.amount;
  }

  @override
  int get hashCode =>
      description.hashCode ^
      amount.hashCode ^
      date.hashCode ^
      category.hashCode;
}
