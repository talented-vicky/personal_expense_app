import 'package:flutter/material.dart';

import './views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ExpenseApp',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        fontFamily: "OpenSans",
        // this will apply to all title text fields, see transaction_list widget
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontFamily: "Quicksand",
                fontSize: 18,
              ),
            ),
        // look up replacement for deprecated feature
        appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                  titleLarge: const TextStyle(
                    fontFamily: "Quicksand",
                    fontSize: 18,
                  ),
                )),
      ),
      home: const HomeView(),
    );
  }
}


// SHAKA ilembe