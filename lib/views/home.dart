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
    // Transaction(
    //   id: "1",
    //   amount: 82.75,
    //   title: "iPhone 11",
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: "2",
    //   amount: 154.25,
    //   title: "HP Elitebook",
    //   date: DateTime.now(),
    // ),
  ];

  void _addTransaction(String tit, double amt) {
    final newTrans = Transaction(
      id: DateTime.now().toString(),
      amount: amt,
      title: tit,
      date: DateTime.now(),
    );
    setState(() {
      _transaction.add(newTrans);
    });
  }

  void _startTrans(BuildContext ctxt) {
    showModalBottomSheet(
      context: ctxt,
      builder: (_) {
        return NewTransaction(transFunction: _addTransaction);
      },
    );
  }

  List<Transaction> get _weeklyTransaction {
    return _transaction.where(
      (elem) {
        return elem.date.isAfter(
          DateTime.now().subtract(const Duration(days: 7)),
        );
      },
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Expense App",
        ),
        actions: [
          IconButton(
            onPressed: () => _startTrans(context),
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
              width: double.infinity,
              margin: const EdgeInsets.all(10),
              child: Chart(
                recentTransaction: _weeklyTransaction,
              )),
          TransactionList(transaction: _transaction),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        // onPressed: () => _startTrans,
        onPressed: () => _startTrans(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
