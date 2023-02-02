import 'dart:ffi';

import 'package:cli/cli.dart' as cli;

void main(List<String> arguments) {
  print(arguments);
  if (arguments.length < 4) {
    print(
        "Please provide details in below format \n Date Category Amount Message \n e.g. 2023-01-02 Rent 1000.0 Housing");
  }
  try {
    DateTime date = DateTime.parse(arguments[0]);
    String category = arguments[1];
    double amount = double.parse(arguments[2]);
    String message = arguments[3];
    print("transaction added for $date $category $amount and $message");
  } on Exception catch (_, e) {
    print("*************** wrong format alert *************");
    print(
        "Please provide details in below format \n Date Category Amount Message \n e.g. 2023-01-02 Rent 1000.0 Housing");
  }
}
