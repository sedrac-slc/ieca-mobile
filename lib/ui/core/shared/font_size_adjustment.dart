import 'package:flutter/material.dart';

mixin FontSizeAdjustment<T extends StatefulWidget> on State<T> {
  double _fontSize = 16.0;

  double get currentFontSize => _fontSize;

  void adjustFontSize(double delta) {
    setState(() {
      _fontSize = (_fontSize + delta).clamp(12.0, 24.0);
    });
  }

  List<Widget> get fontActions => [
    IconButton(
      onPressed: () => adjustFontSize(-2),
      icon: const Text("A-", style: TextStyle(fontWeight: FontWeight.bold)),
    ),
    IconButton(
      onPressed: () => adjustFontSize(2),
      icon: const Text("A+", style: TextStyle(fontWeight: FontWeight.bold)),
    ),
  ];
}
