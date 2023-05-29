import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/transaction.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({super.key, required this.transaction});

  final List<Transaction> transaction;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transaction.isEmpty
          ? Column(
              children: const [
                Text(
                  "Still spending? Anyways, click the plus icon to add your expense",
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 350,
                  child: Image(
                    image:
                        AssetImage("assets/images/healthcare-medical-cost.jpg"),
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemCount: transaction.length,
              itemBuilder: (BuildContext context, int ind) {
                return Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // amount and title/date box
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Theme.of(context).primaryColorDark,
                              ),
                            ),
                            margin: const EdgeInsets.only(left: 10, right: 10),
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              '\$${transaction[ind].amount.toStringAsFixed(3)}',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColorDark),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(transaction[ind].title,
                                    // style: const TextStyle(
                                    //   fontWeight: FontWeight.bold,
                                    //   fontSize: 12,
                                    // ),
                                    style:
                                        Theme.of(context).textTheme.titleSmall
                                    // the above inherits textTheme set in material app (main.dart)
                                    ),
                                Text(
                                  DateFormat.yMMMd()
                                      .format(transaction[ind].date),
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 11,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // delete icon
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: IconButton(
                          onPressed: () {
                            //
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Color.fromARGB(255, 224, 45, 32),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }),
    );
  }
}
