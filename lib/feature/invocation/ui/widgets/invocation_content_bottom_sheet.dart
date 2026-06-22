import 'package:flutter/material.dart';
import 'package:mobile/_import.dart';

class InvocationContentBottomSheet extends StatefulWidget {
  final InvocationTitle invocation;

  const InvocationContentBottomSheet({
    super.key,
    required this.invocation,
  });

  @override
  State<InvocationContentBottomSheet> createState() => _InvocationContentBottomSheetState();
}

class _InvocationContentBottomSheetState extends State<InvocationContentBottomSheet> {
  late final InvocationContentBottomSheetViewModel _viewModel;
  double _fontSize = 16.0;

  @override
  void initState() {
    super.initState();
    _viewModel = InvocationContentBottomSheetViewModel();
  }

  void _adjustFontSize(double delta) {
    setState(() {
      _fontSize = (_fontSize + delta).clamp(12.0, 24.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ContentBottomSheet<InvocationContent>(
      title: widget.invocation.name,
      future: _viewModel.findContentByInvocation(widget.invocation),
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
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (item.books != null && item.books!.isNotEmpty)
                Text(
                  item.books!,
                  style: TextStyle(
                    fontSize: _fontSize * 0.8,
                    color: Colors.grey[600],
                    fontStyle: FontStyle.italic,
                  ),
                ),
              const SizedBox(height: 6),
              Text(
                item.content,
                textAlign: TextAlign.left,
                style: TextStyle(
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