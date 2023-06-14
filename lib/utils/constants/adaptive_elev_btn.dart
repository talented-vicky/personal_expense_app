import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveElevBtn extends StatelessWidget {
  final Function func;
  const AdaptiveElevBtn({super.key, required this.func});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            color: Theme.of(context).primaryColor,
            onPressed: () {
              func();
              Navigator.of(context).pop();
            },
            child: const Icon(CupertinoIcons.add_circled),
          )
        : ElevatedButton(
            onPressed: () {
              func();
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.add_card_sharp),
          );
  }
}
