import 'package:flutter/material.dart';
import 'package:mobile/_import.dart';

class PsalmContentBottomSheet extends StatefulWidget {
  final PsalmsTitle psalm;

  const PsalmContentBottomSheet({
    super.key,
    required this.psalm,
  });

  @override
  State<PsalmContentBottomSheet> createState() => _PsalmContentBottomSheetState();
}

class _PsalmContentBottomSheetState extends State<PsalmContentBottomSheet> {
  late final PsalmContentBottomSheetViewModel _viewModel;
  double _fontSize = 16.0;

  @override
  void initState() {
    super.initState();
    _viewModel = PsalmContentBottomSheetViewModel();
  }

  void _adjustFontSize(double delta) {
    setState(() {
      _fontSize = (_fontSize + delta).clamp(12.0, 24.0);
    });
  }

  String _getLabel(String person) {
    return person == "DIRECTOR" ? "Direção" : "Congregação";
  }

  @override
  Widget build(BuildContext context) {
    return ContentBottomSheet<PsalmsContent>(
      title: widget.psalm.name,
      future: _viewModel.findContentByPsalmsTitle(widget.psalm),
      actions: [
        IconButton(
          onPressed: () => _adjustFontSize(-2),
          icon: const Text("A-", style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        IconButton(
          onPressed: () => _adjustFontSize(2),
          icon: const Text("A+", style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
      itemBuilder: (context, item, index) {
        final isCongregation = item.person != "DIRECTOR";
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _getLabel(item.person),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Color(0xFFE61E62),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                item.content,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: isCongregation ? FontWeight.w800 : FontWeight.normal,
                  fontSize: _fontSize,
                  height: 1.6,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}