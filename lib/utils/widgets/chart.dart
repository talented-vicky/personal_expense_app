import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTrans;
  const Chart({super.key, required this.recentTrans});

  // a getter is a dynamically generated property
  // I guess I just use them when I don't need a param for a func
  List<Map<String, dynamic>> get _transactionGroup {
    return List.generate(7, (ind) {
      // final today = DateTime.now();
      // final threeDaysAgo = today.subtract(const Duration(days: 3));
      final dayOfWeek = DateTime.now().subtract(Duration(days: ind));
      var totAmountSpent = 0.0;
      for (var i = 0; i < recentTrans.length; i++) {
        if (recentTrans[i].date.day == dayOfWeek.day &&
            recentTrans[i].date.month == dayOfWeek.month &&
            recentTrans[i].date.year == dayOfWeek.year) {
          totAmountSpent += recentTrans[i].amount;
        }
      }
      return {
        "day": DateFormat.E().format(dayOfWeek),
        "totAmount": totAmountSpent
      };
    });
  }

  double get _totalExpense => _transactionGroup.fold(
      0.00, (prevVal, element) => prevVal + element["totAmount"]);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4,
        margin: const EdgeInsets.all(8),
        child: Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: _transactionGroup.map((transgroup) {
                  return LayoutBuilder(builder:
                      (BuildContext context, BoxConstraints constraints) {
                    return Column(children: [
                      Container(
                          height: constraints.maxHeight * .15,
                          child: FittedBox(
                              child: Text("\$${transgroup["totAmount"]}"))),
                      SizedBox(height: constraints.maxHeight * .02),
                      Container(
                          height: constraints.maxHeight * .65,
                          width: 13,
                          child: Stack(children: [
                            Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2,
                                        color: Colors.deepPurpleAccent),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(3))),
                            FractionallySizedBox(
                                heightFactor: transgroup['totAmount'] == 0.0
                                    ? 0.0
                                    : transgroup['totAmount'] / _totalExpense,
                                // heightFactor: .8,
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(3))))
                          ])),
                      SizedBox(height: constraints.maxHeight * .02),
                      Container(
                          height: constraints.maxHeight * .15,
                          child: FittedBox(
                              // fittedBox ensures text always fits in space when screen size changes
                              child: Text("${transgroup["day"]}")))
                    ]);
                  });
                }).toList())));
  }
}
