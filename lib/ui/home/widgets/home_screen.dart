import 'package:flutter/material.dart';
import 'package:mobile/_import.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          spacing: 20,
          children: [
            const HomeDayOfSuggestHymn(),
            const HomeCardTotal()
          ],
        ),
      ),
    );
  }
}