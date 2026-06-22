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

class _InvocationContentBottomSheetState extends State<InvocationContentBottomSheet> with FontSizeAdjustment {
  late final InvocationContentBottomSheetViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = InvocationContentBottomSheetViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return ContentBottomSheet<InvocationContent>(
      title: widget.invocation.name,
      future: _viewModel.findContentByInvocation(widget.invocation),
      actions: fontActions,
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
                    fontSize: currentFontSize * 0.8,
                    color: Colors.grey[600],
                    fontStyle: FontStyle.italic,
                  ),
                ),
              const SizedBox(height: 6),
              Text(
                item.content,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: currentFontSize,
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