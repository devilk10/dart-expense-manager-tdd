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
    budgetTracker.add(Expense(dateTime, "category", 100, "some description"));
    List<Transaction> transactions = [
      Expense(dateTime, "category", 100, "some description"),
    ];
    expect(budgetTracker.get(), transactions);
  });

  test("should return expense of category entertainment", () {
    var transaction = Expense(dateTime, "entertainment", 100, "description");
    budgetTracker.add(transaction);
    expect(budgetTracker.getTransactionsByCategory("entertainment"),
        [transaction]);
  });

  test("should return total expenses", () {
    budgetTracker.add(Expense(dateTime, "entertainment", 100, "description"));
    budgetTracker.add(Income(dateTime, "entertainment", 70, "description"));
    budgetTracker.add(Expense(dateTime, "entertainment", 80, "description"));
    expect(budgetTracker.totalExpenses(), 180.00);
  });

  test("should return total income", () {
    budgetTracker.add(Expense(dateTime, "entertainment", 100, "description"));
    budgetTracker.add(Income(dateTime, "entertainment", 70, "description"));
    budgetTracker.add(Expense(dateTime, "entertainment", 80, "description"));
    expect(budgetTracker.totalIncome(), 70.00);
  });
}
