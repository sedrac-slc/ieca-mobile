import 'package:flutter/material.dart';
import 'package:mobile/_import.dart';

class LitanyContentBottomSheet extends StatelessWidget {
  final LitanyTitle litany;
  final LitanyContentBottomSheetViewModel _viewModel;

  LitanyContentBottomSheet({
    super.key,
    required this.litany,
    LitanyContentBottomSheetViewModel? viewModel,
  }) : _viewModel = viewModel ?? LitanyContentBottomSheetViewModel();

  @override
  Widget build(BuildContext context) {
    return ContentBottomSheet<LitanyContent>(
      title: litany.name,
      future: _viewModel.findContentByLitanyTitle(litany),
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
                      '${index + 1}.',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Color(0xFFE61E62),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      item.person,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                if (item.books != null && item.books!.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    item.books!,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
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
