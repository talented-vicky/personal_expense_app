import 'package:flutter/material.dart';

import '../utils/widgets/user_transaction.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Haji me mashite",
        ),
      ),
      body: Column(
        children: [
          Container(
            // width: double.infinity,
            child: const Card(
              child: Text(
                "CHART",
                style: TextStyle(
                  fontSize: 14,
                  letterSpacing: 1.4,
                ),
              ),
            ),
          ),
          // user tansaction
          const UserTransaction()
        ],
      ),
    );
  }
}
