import 'package:flutter/material.dart';

import '../../models/transaction.dart';
import '../widgets/single_transaction.dart';

class TransactionList extends StatelessWidget {
  const TransactionList(
      {super.key, required this.transaction, required this.delTransFunction});

  final List<Transaction> transaction;
  final Function delTransFunction;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    final navContext = Navigator.of(context);
    return transaction.isEmpty
        ? LayoutBuilder(builder: (builder, constraints) {
            return Column(children: [
              Container(
                child: const FittedBox(
                    child: Text("Click the add button to add expenses")),
              ),
              SizedBox(height: constraints.maxHeight * .05),
              SizedBox(
                  height: constraints.maxHeight * .8,
                  child: const Image(
                      image: AssetImage(
                          "assets/images/healthcare-medical-cost.jpg"),
                      fit: BoxFit.cover))
            ]);
          })
        : ListView.builder(
            itemCount: transaction.length,
            itemBuilder: (BuildContext context, int ind) {
              deleteDialogueContext(BuildContext context) {
                Widget cancelBtn = TextButton(
                    onPressed: () => navContext.pop(),
                    child: const Text("Cancel"));
                Widget deleteBtn = TextButton(
                    onPressed: () {
                      delTransFunction(transaction[ind].id);
                      navContext.pop();
                    },
                    child: const Text("Delete"));
                AlertDialog deleteDialogue = AlertDialog(
                    title: const Text("Delete Transaction"),
                    content: const Text(
                        "Deleting this transaction will remove it from transaction database"),
                    actions: [cancelBtn, deleteBtn]);
                showDialog(
                  context: context,
                  builder: (BuildContext builder) => deleteDialogue,
                );
              }

              return SingleTransaction(
                  transaction: transaction[ind],
                  delDial: () => deleteDialogueContext(context),
                  theme: theme,
                  mediaQuery: mediaQuery);
            });
  }
}
