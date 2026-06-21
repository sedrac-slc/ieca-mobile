import 'package:flutter/material.dart';
import 'package:mobile/_import.dart';
import 'package:provider/provider.dart';

class HymnScreen extends StatefulWidget {
  const HymnScreen({super.key});
  @override
  State<HymnScreen> createState() => _HymnScreenState();
}

class _HymnScreenState extends State<HymnScreen> {
  final HymGroupCategoryViewModel _viewModel = HymGroupCategoryViewModel();

  @override
  Widget build(BuildContext context) {
    final section = context.watch<SectionProvider>().section;
    return FutureBuilder<Result<List<HymnsGroup>>>(
      key: ValueKey(section),
      future: _viewModel.findBySection(section),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        return snapshot.data?.when(
          ok: (data) {
            if (data.isEmpty) return const SizedBox.shrink();
            final children = <Widget>[];
            for (int i = 0; i < data.length; i++) {
              if (i > 0) children.add(const SizedBox(height: 10));
              children.add(HymnNumberGrid(hymnsGroup: data[i]));
            }
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(children: children),
            );
          },
          error: (error) => Center(child: Text('Erro: $error')),
        ) ?? const SizedBox.shrink();
      },
    );
  }
}
