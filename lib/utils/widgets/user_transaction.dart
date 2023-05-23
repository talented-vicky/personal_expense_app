import 'package:flutter/material.dart';

import '/utils/widgets/new_transaction.dart';
import '/utils/widgets/transaction_list.dart';
import '../../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({super.key});

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _transaction = [
    Transaction(
      id: "1",
      amount: 82.75,
      title: "iPhone 11",
      date: DateTime.now(),
    ),
    Transaction(
      id: "2",
      amount: 154.25,
      title: "HP Elitebook",
      date: DateTime.now(),
    ),
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // new transaction widget
        NewTransaction(transFunction: _addTransaction),
        // transaction widget
        TransactionList(
          transaction: _transaction,
        ),
      ],
    );
  }
}
