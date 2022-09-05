
import 'package:life_expense_manager/enums/ExpenseFilter.dart';
import 'package:life_expense_manager/models/Expense.dart';
import 'package:life_expense_manager/enums/PaymentMethod.dart';
import 'package:life_expense_manager/models/Expense.dart';

import '../models/ExpenseByMonth.dart';

class ExpenseHelper {

  static List<ExpenseModel> expensesList = [ExpenseModel(id:'',dateOfExpense: '05-09-2022',type: 'Shopping',description: 'Puja Shopping',amount: 1000,byUserId: '',paymentMethod: PaymentMethod.upi)];
  static ExpenseByMonth expenseByMonth = ExpenseByMonth(month: 10, amount: 1000);
  static ExpenseModel getExpenseByDate({ExpenseFilter filterBy=ExpenseFilter.date, String value=''}) {
    return expensesList[0];
  }
  static ExpenseByMonth getExpenseByMonth({ExpenseFilter filterBy=ExpenseFilter.date, String value=''}) {
    return expenseByMonth;
  }
  static var itemCount = expensesList.length;

}
