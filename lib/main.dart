import 'package:flutter/material.dart';
import 'package:life_expense_manager/enums/ExpenseFilter.dart';
import 'package:life_expense_manager/models/ExpenseByMonth.dart';
import 'components/CallHelper.dart';
import 'components/CallItemModel.dart';
import 'helpers/ExpenseHelper.dart';
import 'components/ChatItemModel.dart';
import 'models/Expense.dart';
import 'services/StatusHelper.dart';
import 'models/StatusItemModel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Life Expense Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  Color whatsAppGreen = const Color.fromRGBO(18, 140, 126, 1.0);
  Color whatsAppGreenLight = const Color.fromRGBO(37, 211, 102, 1.0);

  late TabController tabController;
  var fabIcon = Icons.message;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    tabController = TabController(vsync: this, length: 4)
      ..addListener(() {
        setState(() {
          switch (tabController.index) {
            case 0:
              break;
            case 1:
              fabIcon = Icons.message;
              break;
            case 2:
              fabIcon = Icons.camera_enhance;
              break;
            case 3:
              fabIcon = Icons.call;
              break;
          }
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        title:  const Text(
          "Life Expense Manager",
          style: TextStyle(
              color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.w600),
        ),
        backgroundColor: whatsAppGreen,
        bottom: TabBar(
          tabs: const [
            Tab(
              icon: Icon(Icons.edit),
            ),
            Tab(
              child: Text("By Date"),
            ),
            Tab(
                child: Text(
              "By Month",
            )),
            Tab(
                child: Text(
              "By Year",
            )),
          ],
          indicatorColor: Colors.white,
          controller: tabController,
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          const Icon(Icons.camera_alt),
          // expense by date
          ListView.builder(
            itemBuilder: (context, position) {
              ExpenseModel expense = ExpenseHelper.getExpenseByDate(filterBy: ExpenseFilter.date,value: '05-09-2022:13:20');

              return Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        const Icon(
                          Icons.shopping_cart,
                          size: 64.0,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      expense.amount.toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.red,
                                          fontSize: 20.0),
                                    ),
                                    Text(
                                      expense.type,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20.0),
                                    ),
                                    Text(
                                      expense.dateOfExpense,
                                      style: const TextStyle(color: Colors.black45),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: Text(
                                    expense.description,
                                    style: const TextStyle(
                                        color: Colors.black45, fontSize: 16.0),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Divider(),
                ],
              );
            },
            itemCount: ExpenseHelper.itemCount,
          ),
        // expense by month
        ListView.builder(
          itemBuilder: (context, position) {
            ExpenseByMonth expenseByMonth = ExpenseHelper.getExpenseByMonth(filterBy: ExpenseFilter.month,value:'2');

            return Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      const Icon(
                        Icons.money,
                        size: 64.0,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    expenseByMonth.month.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20.0),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 2.0),
                                child: Text(
                                  expenseByMonth.amount.toString(),
                                  style: const TextStyle(
                                      color: Colors.black45, fontSize: 16.0),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const Divider(),
              ],
            );
          },
          itemCount: StatusHelper.itemCount,
        ),
          //expense by year
          ListView.builder(
            itemBuilder: (context, position) {
              CallItemModel callItemModel = CallHelper.getCallItem(position);

              return Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        const Icon(
                          Icons.account_circle,
                          size: 64.0,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          callItemModel.name,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20.0),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 2.0),
                                      child: Text(
                                        callItemModel.dateTime,
                                        style: const TextStyle(
                                            color: Colors.black45, fontSize: 16.0),
                                      ),
                                    ),
                                  ],
                                ),
                                Icon(Icons.call, color: whatsAppGreen,)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Divider(),
                ],
              );
            },
            itemCount: CallHelper.itemCount,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(fabIcon),
        backgroundColor: whatsAppGreenLight,
      ),
    );
  }
}
