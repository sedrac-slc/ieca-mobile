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

class _LitanyContentBottomSheetState extends State<LitanyContentBottomSheet>
    with FontSizeAdjustment {
  late final LitanyContentBottomSheetViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = LitanyContentBottomSheetViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return ContentBottomSheet<LitanyContent>(
      title: widget.litany.name,
      future: _viewModel.findContentByLitanyTitle(widget.litany),
      actions: fontActions,
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
                    fontSize: currentFontSize * 0.8,
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
                  fontSize: currentFontSize,
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