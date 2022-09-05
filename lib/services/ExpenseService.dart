import 'package:life_expense_manager/models/Expense.dart';

class ExpenseService {
  static final ExpenseService _instance = ExpenseService._();

  ExpenseService._();

  static ExpenseService get instance => _instance;

  void addExpense(ExpenseModel expense){

  }
  void syncExpenseToFirebase(){

  }
  List<ExpenseModel> getExpenseByDate(String date) {
    List<ExpenseModel> expenses = [];
    return expenses;
  }

}