import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../../models/transaction.dart';

class SingleTransaction extends StatelessWidget {
  const SingleTransaction({
    super.key,
    required this.transaction,
    required this.theme,
    required this.mediaQuery,
    required this.delDial,
  });

  final Transaction transaction;
  final ThemeData theme;
  final MediaQueryData mediaQuery;
  final Function delDial;

  @override
  Widget build(BuildContext context) => Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 13),
      child: ListTile(
        leading: CircleAvatar(
            child: Text('\$${transaction.amount.toStringAsFixed(2)}',
                style:
                    const TextStyle(fontSize: 9, fontWeight: FontWeight.w200))),
        title: Container(
          margin: const EdgeInsets.only(left: 10, top: 15, bottom: 15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(transaction.title.toLowerCase(),
                style: theme.textTheme.titleSmall
                // the above inherits textTheme set in material app (main.dart)
                ),
            Text(DateFormat.yMMMd().format(transaction.date),
                style: const TextStyle(color: Colors.grey, fontSize: 11))
          ]),
        ),
        trailing: mediaQuery.size.width > 550
            ? TextButton.icon(
                onPressed: () => delDial(),
                icon: Icon(Icons.delete, color: theme.errorColor),
                label:
                    Text("Delete", style: TextStyle(color: theme.errorColor)))
            : IconButton(
                onPressed: () => delDial,
                icon: Icon(Icons.delete, color: theme.errorColor)),
      ));
}
