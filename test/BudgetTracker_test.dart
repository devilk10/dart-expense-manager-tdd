import 'package:cli/Transaction.dart';
import 'package:test/test.dart';
import 'package:cli/BudgetTracker.dart';

void main() {
  late BudgetTracker budgetTracker;
  var dateTime = DateTime.now();

  setUp(() {
    budgetTracker = BudgetTracker();
  });

  test('should add transactions in editedTransaction list', () {
    budgetTracker.add(Expense(
        dateTime.millisecond, dateTime, "category", 100, "some description"));
    List<Transaction> transactions = [
      Expense(
          dateTime.millisecond, dateTime, "category", 100, "some description"),
    ];
    expect(budgetTracker.get(), transactions);
  });

  test("should return expense of category entertainment", () {
    var transaction = Expense(
        dateTime.millisecond, dateTime, "entertainment", 100, "description");
    budgetTracker.add(transaction);
    expect(budgetTracker.getTransactionsByCategory("entertainment"),
        [transaction]);
  });

  test("should return total expenses", () {
    budgetTracker.add(Expense(
        dateTime.millisecond, dateTime, "entertainment", 100, "description"));
    budgetTracker.add(Income(
        dateTime.millisecond, dateTime, "entertainment", 70, "description"));
    budgetTracker.add(Expense(
        dateTime.millisecond, dateTime, "entertainment", 80, "description"));
    expect(budgetTracker.totalExpenses(), 180.00);
  });

  test("should return total income", () {
    budgetTracker.add(Expense(
        dateTime.millisecond, dateTime, "entertainment", 100, "description"));
    budgetTracker.add(Income(
        dateTime.millisecond, dateTime, "entertainment", 70, "description"));
    budgetTracker.add(Expense(
        dateTime.millisecond, dateTime, "entertainment", 80, "description"));
    expect(budgetTracker.totalIncome(), 70.00);
  });

  test("Edit Transactions", () {
    List<Transaction> editedTransaction = [
      Expense(1, dateTime, "Food", 100, "description")
    ];
    budgetTracker
        .add(Expense(1, dateTime, "entertainment", 100, "description"));
    budgetTracker.edit(1, dateTime, "Food", 100, "description");
    expect(budgetTracker.get()[0].toString(), editedTransaction[0].toString());
  });
}