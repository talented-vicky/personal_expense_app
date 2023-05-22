import 'package:flutter/material.dart';

import '../widgets/user_transaction.dart';

class NewTransaction extends StatelessWidget {
  NewTransaction({super.key});
  final titleCtrl = TextEditingController();
  final amountCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(
        4,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            controller: titleCtrl,
            decoration: const InputDecoration(
                hintText: "Enter Title Here",
                hintStyle: TextStyle(
                  fontSize: 10,
                  fontStyle: FontStyle.italic,
                ),
                labelText: "Title",
                labelStyle: TextStyle(
                  fontSize: 15,
                )),
          ),
          TextField(
            controller: amountCtrl,
            decoration: const InputDecoration(
              hintText: "Amount",
              hintStyle: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
              ),
              labelText: "Enter a valid amount",
              labelStyle: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
            onPressed: () {
              print(titleCtrl.text);
              // UserTransaction().ad
            },
            child: Container(
              height: 20,
              width: 10,
              decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: const Icon(
                Icons.add,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const UserTransaction()
        ],
      ),
    );
  }
}
