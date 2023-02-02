abstract class Transaction {
  final int id;
  DateTime date;
  double amount;
  String description;
  String category;

  Transaction(this.id, this.date, this.category, this.amount, this.description);

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

  void update(
      [DateTime? dateTime,
      String? category,
      double? amount,
      String? description]) {
    if (dateTime != null) date = dateTime;
    if (category != null) this.category = category;
    if (amount != null) this.amount = amount;
    if (description != null) this.description = description;
  }

  @override
  String toString() {
    return "$id $description $amount $category $date";
  }
}

class Expense extends Transaction {
  Expense(
      super.id, super.date, super.category, super.amount, super.description);
}

class Income extends Transaction {
  Income(super.id, super.date, super.category, super.amount, super.description);
}
