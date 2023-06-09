import 'package:flutter/material.dart';

import '../utils/widgets/new_transaction.dart';
import '../models/transaction.dart';
import '../utils/widgets/transaction_list.dart';
import '../utils/widgets/chart.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<Transaction> _transaction = [
    Transaction(
      id: DateTime.now().toString(),
      amount: 23.56,
      title: "fish colt",
      date: DateTime.now().subtract(const Duration(days: 3)),
    ),
    Transaction(
      id: DateTime.now().toString(),
      amount: 13.44,
      title: "barney",
      date: DateTime.now().subtract(const Duration(days: 5)),
    ),
    Transaction(
      id: DateTime.now().toString(),
      amount: 78.34,
      title: "cashew",
      date: DateTime.now().subtract(const Duration(days: 1)),
    ),
    Transaction(
      id: DateTime.now().toString(),
      amount: 5.62,
      title: "chocolate",
      date: DateTime.now().subtract(const Duration(days: 6)),
    ),
    Transaction(
      id: DateTime.now().toString(),
      amount: 35.401,
      title: "loafer",
      date: DateTime.now().subtract(const Duration(days: 2)),
    ),
    Transaction(
      id: DateTime.now().toString(),
      amount: 21.33,
      title: "sunlace",
      date: DateTime.now().subtract(const Duration(days: 4)),
    ),
    Transaction(
      id: DateTime.now().toString(),
      amount: 78.21,
      title: "cryolite",
      date: DateTime.now().subtract(const Duration(days: 3)),
    ),
    Transaction(
      id: DateTime.now().toString(),
      amount: 213.67,
      title: "netling",
      date: DateTime.now().subtract(const Duration(days: 6)),
    ),
    Transaction(
      id: DateTime.now().toString(),
      amount: 19.72,
      title: "casting liner",
      date: DateTime.now().subtract(const Duration(days: 1)),
    )
  ];

  void _addTransaction(String tit, double amt, DateTime dt) {
    setState(
      () => _transaction.add(Transaction(
          id: DateTime.now().toString(), amount: amt, title: tit, date: dt)),
    );
  }

  void _deleteTransaction(String id) {
    setState(() => _transaction.removeWhere((elem) => elem.id == id));
  }

  void _startTrans(BuildContext ctxt) {
    showModalBottomSheet(
      context: ctxt,
      builder: (_) => NewTransaction(transFunction: _addTransaction),
    );
  }

  List<Transaction> get _weeklyTransaction => _transaction
      .where((elem) =>
          elem.date.isAfter(DateTime.now().subtract(const Duration(days: 7))))
      .toList();

  @override
  Widget build(BuildContext context) {
    final appbar = AppBar(
      title: Text(
        "My Expenses",
        // style: Theme.of(context).textTheme.titleLarge,
        style: Theme.of(context).appBarTheme.textTheme!.titleLarge,
      ),
      actions: [
        IconButton(
          onPressed: () => _startTrans(context),
          icon: const Icon(Icons.add),
        ),
      ],
    );
    return Scaffold(
      appBar: appbar,
      body: Column(
        children: [
          Container(
              height: (MediaQuery.of(context).size.height -
                      appbar.preferredSize.height) *
                  .2,
              width: double.infinity,
              margin: const EdgeInsets.all(10),
              child: Chart(
                recentTrans: _weeklyTransaction,
              )),
          Container(
            height: (MediaQuery.of(context).size.height -
                    appbar.preferredSize.height) *
                .75,
            child: TransactionList(
                transaction: _transaction,
                delTransFunction: _deleteTransaction),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startTrans(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
