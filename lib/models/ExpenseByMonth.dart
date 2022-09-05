import 'dart:io';
import 'dart:io' as io;

import 'package:life_expense_manager/enums/PaymentMethod.dart';

class ExpenseByMonth {
  int month = 1;
  int amount = 0;

  ExpenseByMonth(
      {this.month = 1,
        this.amount = 0
      });
  Map toJson() => {
    'month': month,
    'amount': amount
  };
  ExpenseByMonth.fromJson(Map<String, dynamic> json) {
    month = json['month'];
    amount = json['amount'];
  }
}