import 'package:flutter/material.dart';
import 'package:mobile/_import.dart';

class HymnContentBottomSheet extends StatefulWidget {
  final HymnsNumber hymnNumber;

  const HymnContentBottomSheet({super.key, required this.hymnNumber});

  @override
  State<HymnContentBottomSheet> createState() => _HymnContentBottomSheetState();
}

class _HymnContentBottomSheetState extends State<HymnContentBottomSheet> {
  final HymContentBottomSheetViewModel _viewModel = HymContentBottomSheetViewModel();
  static const Color pink = Color(0xFFE91E63);

  double _fontSize = 16.0;

  void _adjustFontSize(bool increase) {
    setState(() {
      if (increase) {
        _fontSize += 2.0;
      } else if (_fontSize > 10.0) {
        _fontSize -= 2.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                Text(
                  widget.hymnNumber.num.toString(),
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.text_decrease),
                  onPressed: () => _adjustFontSize(false),
                ),
                IconButton(
                  icon: const Icon(Icons.text_increase),
                  onPressed: () => _adjustFontSize(true),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: SectionFutureBuilder<HymnsContent>(
              keyValue: widget.hymnNumber,
              future: _viewModel.findByHymnNumber(widget.hymnNumber),
              builder: (context, items) {
                int count = 0;
                final List<String> labels = items.map((item) {
                  if (item.typeStanza != HymnContentTypeStanza.CHOIR) count++;
                  return item.typeStanza == HymnContentTypeStanza.CHOIR
                      ? 'REFRÃO'
                      : 'VERSO $count';
                }).toList();

                return ListView.separated(
                  padding: const EdgeInsets.all(24),
                  itemCount: items.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 32),
                  itemBuilder: (context, index) {
                    final item = items[index];
                    final isChoir = item.typeStanza == HymnContentTypeStanza.CHOIR;
                    final content = StringUtil.replaceContent(item.content);

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          labels[index],
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: pink,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          width: double.infinity,
                          decoration: isChoir
                              ? BoxDecoration(
                            color: const Color(0xFFFFF3F8),
                            borderRadius: BorderRadius.circular(12),
                          )
                              : null,
                          child: Text(
                            content,
                            style: TextStyle(
                              fontSize: _fontSize,
                              height: 1.6,
                              color: isChoir ? pink : Colors.black87,
                              fontWeight: isChoir ? FontWeight.w600 : FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}