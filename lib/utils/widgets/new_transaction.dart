import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

import '../constants/adaptive_text_btn.dart';
import '../constants/adaptive_elev_btn.dart';

class NewTransaction extends StatefulWidget {
  const NewTransaction({super.key, required this.transFunction});

  final Function transFunction;

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleCtrl = TextEditingController();
  final _amountCtrl = TextEditingController();
  DateTime? _chosenDate;

  void _submitFunc() {
    if ((_titleCtrl.text.length < 3) ||
        (double.parse(_amountCtrl.text) < 0) ||
        (_chosenDate == null)) return;
    widget.transFunction(
        _titleCtrl.text, double.parse(_amountCtrl.text), _chosenDate);
  }

  void _displayDatePicker() async {
    final date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime.now());
    if (date == null) return;
    setState(() => _chosenDate = date);
  }

  @override
  Widget build(BuildContext context) => Card(
      margin: const EdgeInsets.all(8),
      child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        TextField(
            controller: _titleCtrl,
            keyboardType: TextInputType.text,
            onSubmitted: (_) => _submitFunc(),
            decoration: const InputDecoration(
                labelText: "Enter Title",
                labelStyle: TextStyle(fontSize: 15),
                hintText: "Enter at least 3 character",
                hintStyle:
                    TextStyle(fontSize: 10, fontStyle: FontStyle.italic))),
        TextField(
            controller: _amountCtrl,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => _submitFunc(),
            decoration: const InputDecoration(
                labelText: "Amount",
                labelStyle: TextStyle(fontSize: 15),
                hintText: "Enter a non-negative value",
                hintStyle:
                    TextStyle(fontSize: 14, fontStyle: FontStyle.italic))),
        const SizedBox(height: 15),
        Row(children: [
          _chosenDate != null
              // ? Text((DateFormat.yMd(_chosenDate).toString()))
              ? Text(DateFormat.yMd().format(_chosenDate!))
              : const Text("No Date Selected"),
          Flexible(
              fit: FlexFit.tight,
              child: AdaptiveTextBtn(
                  text: "Pick a Date", func: _displayDatePicker))
        ]),
        const SizedBox(height: 15),
        Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: AdaptiveElevBtn(func: _submitFunc))
      ]));
}
