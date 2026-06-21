import 'package:flutter/material.dart';
import 'package:mobile/_import.dart';
import 'package:provider/provider.dart';

class HomeCardTotal extends StatefulWidget {
  const HomeCardTotal({super.key});

  @override
  State<HomeCardTotal> createState() => _HomeCardTotalState();
}

class _HomeCardTotalState extends State<HomeCardTotal> {
  final _hymnsNumberService = HymnNumberService();
  final _invocationService = InvocationService();
  final _litanyService = LitanyService();
  final _psalmsService = PsalmService();

  @override
  void initState() {
    super.initState();
  }

  Future<_ItemTotal> _loadData(Section section) async {
    final invocation = await _invocationService.countBySection(section);
    final litany = await _litanyService.countBySection(section);
    final hymns = await _hymnsNumberService.countBySection(section);
    final psalms = await _psalmsService.countBySection(section);

    return _ItemTotal(hymns, psalms, litany, invocation);
  }

  @override
  Widget build(BuildContext context) {
    final section = context.watch<SectionProvider>().section;
    return FutureBuilder<_ItemTotal>(
      key: ValueKey(section),
      future: _loadData(section),
      builder: (context, snapshot){

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            height: 100,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        final result = snapshot.data;
        if (result == null) {
          return const SizedBox.shrink();
        }

        return GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          childAspectRatio: 1.3,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          padding: const EdgeInsets.all(5),
          children: [
            _SummaryCard(label: 'Total Hinos', count: result.totalHymns),
            _SummaryCard(label: 'Litanias', count: result.totalLitany),
            _SummaryCard(label: 'Salmos', count: result.totalPsalms),
            _SummaryCard(label: 'Invocação', count: result.totalInvocation),
          ],
        );
      },
    );
  }
}

class _ItemTotal {
  final int totalHymns;
  final int totalPsalms;
  final int totalLitany;
  final int totalInvocation;

  _ItemTotal(
    this.totalHymns,
    this.totalPsalms,
    this.totalLitany,
    this.totalInvocation,
  );
}

class _SummaryCard extends StatelessWidget {
  final String label;
  final int count;

  const _SummaryCard({required this.label, required this.count, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.pinkAccent.withAlpha(5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(5),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label.toUpperCase(),
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '$count',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.pink,
            ),
          ),
        ],
      ),
    );
  }
}
