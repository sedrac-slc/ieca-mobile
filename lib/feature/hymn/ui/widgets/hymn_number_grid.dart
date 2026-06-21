import 'package:flutter/material.dart';
import 'package:mobile/_import.dart';

class HymnNumberGrid extends StatefulWidget {
  final HymnsGroup hymnsGroup;

  const HymnNumberGrid({super.key, required this.hymnsGroup});

  @override
  State<HymnNumberGrid> createState() => _HymnNumberGridState();
}

class _HymnNumberGridState extends State<HymnNumberGrid> {
  final HymNumberGridViewModel _viewModel = HymNumberGridViewModel();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            widget.hymnsGroup.name,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xFFE61E62),
            ),
          ),
        ),
        SectionFutureBuilder<HymnsNumber>(
          keyValue: ValueKey(widget.hymnsGroup),
          future: _viewModel.findByHymnsGroup(widget.hymnsGroup),
          builder: (context, items) => GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 6,
              mainAxisSpacing: 8,
              childAspectRatio: 1.1,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final hymnNumber = items[index];
              return InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    useSafeArea: true,
                    constraints: BoxConstraints(
                      maxWidth: double.infinity,
                      maxHeight: MediaQuery.of(context).size.height,
                    ),
                    builder: (context) => HymnContentBottomSheet(hymnNumber: hymnNumber,),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(13),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    hymnNumber.num.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
