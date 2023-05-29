import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  NewTransaction({super.key, required this.transFunction});

  final titleCtrl = TextEditingController();
  final amountCtrl = TextEditingController();
  final Function transFunction;

  void submitFunc() {
    // if (titleCtrl.text.isEmpty || double.parse(amountCtrl.text) < 0) {
    if (titleCtrl.text.length < 3 || double.parse(amountCtrl.text) < 0) {
      return;
    }
    transFunction(
      titleCtrl.text,
      double.parse(amountCtrl.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(
        8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            controller: titleCtrl,
            keyboardType: TextInputType.text,
            onSubmitted: (_) => submitFunc(),
            decoration: const InputDecoration(
              labelText: "Enter Title",
              labelStyle: TextStyle(
                fontSize: 15,
              ),
              hintText: "Enter at least 3 character",
              hintStyle: TextStyle(
                fontSize: 10,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          TextField(
            controller: amountCtrl,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => submitFunc(),
            decoration: const InputDecoration(
              labelText: "Amount",
              labelStyle: TextStyle(
                fontSize: 15,
              ),
              hintText: "Enter a non-negative value",
              hintStyle: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: ElevatedButton(
              onPressed: () {
                submitFunc();
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.add,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
