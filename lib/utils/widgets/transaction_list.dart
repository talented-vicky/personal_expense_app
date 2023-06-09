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
    return transaction.isEmpty
        ? Column(children: const [
            Text(
                "Still spending? Anyways, click the plus icon to add your expense"),
            SizedBox(height: 20),
            SizedBox(
                height: 350,
                child: Image(
                  image:
                      AssetImage("assets/images/healthcare-medical-cost.jpg"),
                  fit: BoxFit.cover,
                ))
          ])
        : ListView.builder(
            itemCount: transaction.length,
            itemBuilder: (BuildContext context, int ind) {
              return Card(
                  elevation: 4,
                  margin: const EdgeInsets.only(bottom: 13),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(
                          '\$${transaction[ind].amount.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w200,
                          )),
                    ),
                    title: Container(
                      margin:
                          const EdgeInsets.only(left: 10, top: 15, bottom: 15),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(transaction[ind].title.toLowerCase(),
                                style: Theme.of(context).textTheme.titleSmall
                                // the above inherits textTheme set in material app (main.dart)
                                ),
                            Text(
                                DateFormat.yMMMd()
                                    .format(transaction[ind].date),
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 11,
                                ))
                          ]),
                    ),
                    trailing: IconButton(
                      onPressed: () => delTransFunction(transaction[ind].id),
                      icon: const Icon(Icons.delete,
                          color: Color.fromARGB(255, 224, 45, 32)),
                    ),
                  ));
            });
  }
}
