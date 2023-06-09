import 'package:flutter/material.dart';

import './views/home.dart';

void main() => runApp(const MyApp());
// WidgetsFlutterBinding.ensureInitialized();
// SystemChrome.setPreferredOrientations(
// [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

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
                titleMedium:
                    const TextStyle(fontFamily: "Quicksand", fontSize: 18),
                titleSmall:
                    const TextStyle(fontFamily: "Quicksand", fontSize: 16)),
            appBarTheme: AppBarTheme(
                textTheme: ThemeData.light().textTheme.copyWith(
                    titleLarge: const TextStyle(
                        fontFamily: "Quicksand",
                        fontSize: 19,
                        color: Colors.white)))),
        home: const HomeView());
  }
}

// SHAKA ilembe
// I surrender all to you | i give myself away | Daily as I live | You are the reason I live | Lord I give you my heart => EBEZENA

// downloads
// the other side --Luli
// mp3
// ZAYN (2), Maroon 5 (2)
// am I wrong/

/* 
to dream withoug borders or boundaries, to seek adventure,
to obsess and create => the world IMPOSSIBLE doesn't have to exist
*/
