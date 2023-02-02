import 'package:cli/Transaction.dart';
import 'package:test/test.dart';
import 'package:cli/BudgetTracker.dart';

void main() {
  late BudgetTracker budgetTracker;
  var dateTime = DateTime.now();

  setUp(() {
    budgetTracker = BudgetTracker();
  });

  test('should add transactions in transaction list', () {
    budgetTracker
        .add(Transaction(dateTime, "category", 100, "some description"));
    List<Transaction> transactions = [
      Transaction(dateTime, "category", 100, "some description"),
    ];
    expect(budgetTracker.get(), transactions);
  });

  test("should return expense of category entertainment", () {
    var transaction =
        Transaction(dateTime, "entertainment", 100, "description");
    budgetTracker.add(transaction);
    expect(budgetTracker.getTransactionsByCategory("entertainment"), transaction);
  });
}
