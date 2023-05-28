import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;
  const Chart({super.key, required this.recentTransaction});

  // a getter is a dynamically generated property
  // I guess I just use them when I don't need a param for a func
  List<Map<String, Object>> get _transactionGroup {
    return List.generate(7, (ind) {
      // final today = DateTime.now();
      // final eightDaysAgo = today.subtract(const Duration(days: 8));
      final dayOfWeek = DateTime.now().subtract(
        Duration(days: ind),
      );
      var totAmountSpent = 0.0;
      for (var i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == dayOfWeek.day &&
            recentTransaction[i].date.month == dayOfWeek.month &&
            recentTransaction[i].date.year == dayOfWeek.year) {
          totAmountSpent += recentTransaction[i].amount;
        }
      }
      return {
        "day": DateFormat.E().format(dayOfWeek),
        "totAmount": totAmountSpent,
      };
    });
  }

  double get _totalExpense {
    return _transactionGroup.fold(
      0.00,
      (prevVal, element) => prevVal + element[],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _transactionGroup.map((transgroup) {
          return Column(
            children: [
              // total spendings
              Text("${transgroup["totAmount"]}"),
              // bar
              Container(
                height: 40,
                width: 10,
                child: Stack(children: [
                  Container(
                    decoration: BoxDecoration(
                      border:
                          Border.all(width: 1, color: Colors.lightBlueAccent),
                      color: Colors.tealAccent,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    // child: Text("${element['totAmount']}"),
                  ),
                  FractionallySizedBox(
                      heightFactor: _totalExpense / transgroup['totAmount'],
                      child: Container(
                        decoration: BoxDecoration(
                          // border: Border.all(width: 1, color: Colors.red),
                          color: Colors.deepPurpleAccent,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ))
                ]),
              ),
              // day of the week
              Text("Day: ${transgroup["day"]}"),
            ],
          );
        }).toList(),
      ),
    );
  }
}
