import 'package:flutter/material.dart';
import 'package:mobile/_import.dart';

class InvocationContentBottomSheet extends StatelessWidget {
  final InvocationTitle invocation;
  final InvocationContentBottomSheetViewModel _viewModel;

  InvocationContentBottomSheet({
    super.key,
    required this.invocation,
    InvocationContentBottomSheetViewModel? viewModel,
  }) : _viewModel = viewModel ?? InvocationContentBottomSheetViewModel();

  @override
  Widget build(BuildContext context) {
    return ContentBottomSheet<InvocationContent>(
      title: invocation.name,
      future: _viewModel.findContentByInvocation(invocation),
      itemBuilder: (context, item, index) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '${item.position}.',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Color(0xFFE61E62),
                      ),
                    ),
                    const SizedBox(width: 8),
                    if (item.books != null && item.books!.isNotEmpty)
                      Text(
                        item.books!,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  item.content,
                  style: const TextStyle(fontSize: 14, height: 1.5),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
