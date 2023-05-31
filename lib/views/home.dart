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
  final List<Transaction> _transaction = [];

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
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Expense App",
        ),
        actions: [
          IconButton(
            onPressed: () => _startTrans(context),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
              width: double.infinity,
              margin: const EdgeInsets.all(10),
              child: Chart(
                recentTrans: _weeklyTransaction,
              )),
          TransactionList(
              transaction: _transaction, delTransFunction: _deleteTransaction),
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
