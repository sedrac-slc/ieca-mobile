import 'package:flutter/material.dart';
import 'package:mobile/_import.dart';

class LitanyContentBottomSheet extends StatefulWidget {
  final LitanyTitle litany;

  const LitanyContentBottomSheet({
    super.key,
    required this.litany,
  });

  @override
  State<LitanyContentBottomSheet> createState() => _LitanyContentBottomSheetState();
}

class _LitanyContentBottomSheetState extends State<LitanyContentBottomSheet> {
  late final LitanyContentBottomSheetViewModel _viewModel;
  double _fontSize = 16.0;

  @override
  void initState() {
    super.initState();
    _viewModel = LitanyContentBottomSheetViewModel();
  }

  void _adjustFontSize(double delta) {
    setState(() {
      _fontSize = (_fontSize + delta).clamp(12.0, 24.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ContentBottomSheet<LitanyContent>(
      title: widget.litany.name,
      future: _viewModel.findContentByLitanyTitle(widget.litany),
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
                StringUtil.getPersonLabel(item.person),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Color(0xFFE61E62),
                ),
              ),
              if (item.books != null && item.books!.isNotEmpty) ...[
                const SizedBox(height: 4),
                Text(
                  item.books!,
                  style: TextStyle(
                    fontSize: _fontSize * 0.8,
                    color: Colors.grey[600],
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
              const SizedBox(height: 6),
              Text(
                item.content,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: _fontSize,
                  height: 1.6,
                  fontWeight: isCongregation ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}