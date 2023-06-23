import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveTextBtn extends StatelessWidget {
  final String text;
  final Function func;
  const AdaptiveTextBtn({super.key, required this.text, required this.func});

  @override
  Widget build(BuildContext context) => Platform.isIOS
      ? CupertinoButton(
          onPressed: () => func(),
          child:
              Text(text, style: const TextStyle(fontWeight: FontWeight.bold)))
      : TextButton(
          onPressed: () => func(),
          child:
              Text(text, style: const TextStyle(fontWeight: FontWeight.bold)));
}
