import 'package:flutter/material.dart';

class HomeDayOfSuggestHymn extends StatefulWidget {
  const HomeDayOfSuggestHymn({super.key});

  @override
  State<HomeDayOfSuggestHymn> createState() => _HomeDayOfSuggestHymnState();
}

class _HomeDayOfSuggestHymnState extends State<HomeDayOfSuggestHymn> {
  @override
  Widget build(BuildContext context) {
    return
      Container(
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.pinkAccent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            Text(
              "Sugestão do Dia",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Hino 545 - \"Porque Ele Vive\"",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      );
  }
}
