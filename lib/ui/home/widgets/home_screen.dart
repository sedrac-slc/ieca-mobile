import 'package:flutter/material.dart';
import 'package:mobile/_import.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          spacing: 20,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Pesquisar hinos, números ou letras...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            const HymnGroupCategory(),
            const HomeDayOfSuggestHymn(),
            const HomeCardTotal()
          ],
        ),
      ),
    );
  }
}