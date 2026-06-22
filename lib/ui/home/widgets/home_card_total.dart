import 'package:flutter/material.dart';
import 'package:mobile/_import.dart';
import 'package:provider/provider.dart';

class HomeCardTotal extends StatelessWidget {
  const HomeCardTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final section = context.watch<SectionProvider>().section;

    return FutureBuilder(
      future: Future.wait([
        InvocationService().countBySection(section),
        LitanyService().countBySection(section),
        HymnNumberService().countBySection(section),
        PsalmService().countBySection(section),
      ]),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const SizedBox(height: 80, child: Center(child: CircularProgressIndicator()));

        final data = snapshot.data as List<int>;
        final items = {'Hinos': data[2], 'Litanias': data[1], 'Salmos': data[3], 'Invocação': data[0]};

        return GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          childAspectRatio: 2.5,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          padding: const EdgeInsets.symmetric(horizontal: 5),
          children: items.entries.map((e) => _SummaryCard(e.key, e.value)).toList(),
        );
      },
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final String label;
  final int count;
  const _SummaryCard(this.label, this.count);

  @override
  Widget build(BuildContext context) {
    final icons = {
      'Hinos': Icons.music_note,
      'Litanias': Icons.description,
      'Salmos': Icons.book,
      'Invocação': Icons.mic
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Icon(icons[label], color: Colors.pinkAccent, size: 20),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$count', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, height: 1.0,)),
                const SizedBox(height: 10),
                Text(label.toUpperCase(), style: const TextStyle(fontSize: 9, color: Colors.grey, fontWeight: FontWeight.w700, height: 1.0,)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}