import 'package:flutter/material.dart';

class HomeDayOfSuggestHymn extends StatefulWidget {
  const HomeDayOfSuggestHymn({super.key});

  @override
  State<HomeDayOfSuggestHymn> createState() => _HomeDayOfSuggestHymnState();
}

class _HomeDayOfSuggestHymnState extends State<HomeDayOfSuggestHymn> {
  final List<Map<String, dynamic>> _items = [
    {
      "label": "HINO DO MÊS",
      "title": "Grandioso és Tu",
      "desc": "Redescubra a majestade da criação através deste hino.",
      "icon": Icons.music_note
    },
    {
      "label": "FEATURED",
      "title": "Liturgia das Horas",
      "desc": "Discover the updated collection of seasonal invocations.",
      "icon": Icons.star
    },
    {
      "label": "RECOMMENDED READING",
      "title": "Litany of the Saints",
      "desc": "Join the congregation in a responsive prayer for divine guidance and grace.",
      "icon": Icons.menu_book
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.9),
        itemCount: _items.length,
        pageSnapping: true,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(
              left: index == 0 ? 0 : 16,
              right: index == _items.length - 1 ? 0 : 0,
            ),
            child: _buildCard(_items[index]),
          );
        },
      ),
    );
  }

  Widget _buildCard(Map<String, dynamic> data) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.pinkAccent,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(data["label"], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
              const SizedBox(height: 8),
              Text(data["title"], style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(data["desc"], style: const TextStyle(color: Colors.white70, fontSize: 13)),
            ],
          ),
          Positioned(
            right: -10,
            bottom: -10,
            child: Icon(data["icon"], size: 80, color: Colors.white.withAlpha(50)),
          ),
        ],
      ),
    );
  }
}