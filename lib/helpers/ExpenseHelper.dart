
import 'package:life_expense_manager/models/Expense.dart';
import 'package:life_expense_manager/enums/PaymentMethod.dart';
import 'package:life_expense_manager/models/Expense.dart';

class ExpenseHelper {

  static List<ExpenseModel> expensesList = [ExpenseModel(id:'',dateOfExpense: '05-09-2022',type: 'Shopping',description: 'Puja Shopping',amount: 1000,byUserId: '',paymentMethod: PaymentMethod.upi)];

  static ExpenseModel getExpense({String filterBy='date', String value=''}) {
    return expensesList[0];
  }

  static var itemCount = expensesList.length;

}
