import 'dart:io';
import 'dart:io' as io;

import 'package:life_expense_manager/enums/PaymentMethod.dart';

class ExpenseModel {
  String id = '';
  String dateOfExpense = '';
  String type = '';
  String description = '';
  int amount = 0;
  String byUserId='';
  PaymentMethod paymentMethod=PaymentMethod.none;

  ExpenseModel(
      {this.id = '',
        this.dateOfExpense = '',
        this.type = '',
        this.description = '',
        this.amount = 0,
        this.byUserId = '',
        this.paymentMethod = PaymentMethod.none
      });
  Map toJson() => {
    'id': id,
    'dateOfExpense': dateOfExpense,
    'type': type,
    'description': description,
    'amount': amount,
    'byUserId': byUserId,
    'paymentMethod':paymentMethod
  };
  ExpenseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateOfExpense = json['dateOfExpense'];
    type = json['type'];
    description = json['description'];
    amount = json['amount'];
    byUserId= json['byUserId'];
    paymentMethod=json['paymentMethod'];
  }
}