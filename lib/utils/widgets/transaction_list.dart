import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/transaction.dart';

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
                  child: Text("Click the add button to add expenses"),
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * .05,
              ),
              SizedBox(
                  height: constraints.maxHeight * .8,
                  child: const Image(
                    image:
                        AssetImage("assets/images/healthcare-medical-cost.jpg"),
                    fit: BoxFit.cover,
                  ))
            ]);
          })
        : ListView.builder(
            itemCount: transaction.length,
            itemBuilder: (BuildContext context, int ind) {
              deleteDialogueContext(BuildContext context) {
                Widget cancelBtn = TextButton(
                  onPressed: () => navContext.pop(),
                  child: const Text("Cancel"),
                );
                Widget deleteBtn = TextButton(
                  onPressed: () {
                    delTransFunction(transaction[ind].id);
                    navContext.pop();
                  },
                  child: const Text("Delete"),
                );
                AlertDialog deleteDialogue = AlertDialog(
                  title: const Text("Delete Transaction"),
                  content: const Text(
                    "Deleting this transaction will remove it from transaction database",
                  ),
                  actions: [cancelBtn, deleteBtn],
                );
                showDialog(
                  context: context,
                  builder: (BuildContext builder) => deleteDialogue,
                );
              }

              return Card(
                  elevation: 4,
                  margin: const EdgeInsets.only(bottom: 13),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(
                          '\$${transaction[ind].amount.toStringAsFixed(2)}',
                          style: const TextStyle(
                              fontSize: 9, fontWeight: FontWeight.w200)),
                    ),
                    title: Container(
                      margin:
                          const EdgeInsets.only(left: 10, top: 15, bottom: 15),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(transaction[ind].title.toLowerCase(),
                                style: theme.textTheme.titleSmall
                                // the above inherits textTheme set in material app (main.dart)
                                ),
                            Text(
                                DateFormat.yMMMd()
                                    .format(transaction[ind].date),
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 11))
                          ]),
                    ),
                    trailing: mediaQuery.size.width > 550
                        ? TextButton.icon(
                            onPressed: () => deleteDialogueContext(context),
                            icon: Icon(Icons.delete, color: theme.errorColor),
                            label: Text("Delete",
                                style: TextStyle(color: theme.errorColor)),
                          )
                        : IconButton(
                            onPressed: () => deleteDialogueContext(context),
                            icon: Icon(Icons.delete, color: theme.errorColor),
                          ),
                  ));
            });
  }
}
