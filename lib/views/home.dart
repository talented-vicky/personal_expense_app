import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

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
  bool _showChart = false;
  final List<Transaction> _transaction = [
    // Transaction(
    //   id: DateTime.now().toString(),
    //   amount: 23.56,
    //   title: "fish colt",
    //   date: DateTime.now().subtract(const Duration(days: 3)),
    // ),
    // Transaction(
    //   id: DateTime.now().toString(),
    //   amount: 13.44,
    //   title: "barney",
    //   date: DateTime.now().subtract(const Duration(days: 5)),
    // ),
    // Transaction(
    //   id: DateTime.now().toString(),
    //   amount: 78.34,
    //   title: "cashew",
    //   date: DateTime.now().subtract(const Duration(days: 1)),
    // )
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
    final mediaQuery = MediaQuery.of(context);
    final pagePortrait = mediaQuery.orientation == Orientation.portrait;

    final barTitle = Text(
      "My Expenses",
      style: Theme.of(context).appBarTheme.textTheme!.titleLarge,
    );
    final barIcon = IconButton(
      onPressed: () => _startTrans(context),
      icon: const Icon(Icons.add),
    );

    final PreferredSizeWidget appbar = (Platform.isIOS
        ? CupertinoNavigationBar(
            middle: barTitle,
            trailing: barIcon,
          )
        : AppBar(
            title: barTitle,
            actions: [barIcon],
          )) as PreferredSizeWidget;

    final transListContainer = Container(
      height: (mediaQuery.size.height - appbar.preferredSize.height) * .67,
      child: TransactionList(
          transaction: _transaction, delTransFunction: _deleteTransaction),
    );
    final chartContainer = Container(
      height: (mediaQuery.size.height - appbar.preferredSize.height) * .2,
      width: double.infinity,
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 2),
      child: Chart(recentTrans: _weeklyTransaction),
    );

    final body = Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: (mediaQuery.size.height - appbar.preferredSize.height) * .1,
            child: _transaction.isNotEmpty
                ? Column(children: [
                    const Text("Show Chart"),
                    Switch.adaptive(
                        value: _showChart,
                        onChanged: (_) => setState(() => _showChart = _)),
                  ])
                : Container(
                    margin: const EdgeInsets.only(top: 8),
                    child: const Text("No transaction entered yet"),
                  ),
          ),
          if (pagePortrait)
            if (_showChart && _transaction.isNotEmpty) chartContainer,
          if (pagePortrait) transListContainer,
          if (!pagePortrait) _showChart ? chartContainer : transListContainer,
        ],
      ),
    );
    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(middle: appbar),
            child: body,
          )
        : Scaffold(
            appBar: appbar,
            body: body,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    onPressed: () => _startTrans(context),
                    child: const Icon(Icons.add),
                  ),
          );
  }
}
