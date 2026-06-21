import 'package:flutter/material.dart';
import 'package:mobile/_import.dart';
import 'package:provider/provider.dart';

class PsalmsScreen extends StatefulWidget {
  const PsalmsScreen({super.key});

  @override
  State<PsalmsScreen> createState() => _PsalmsScreenState();
}

class _PsalmsScreenState extends State<PsalmsScreen> {
  late final PsalmViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = PsalmViewModel();
  }

  @override
  Widget build(BuildContext context) {
    final section = context.watch<SectionProvider>().section;
    return Column(
      children: [
        SectionFutureBuilder<PsalmsTitle>(
          keyValue: section,
          future: _viewModel.findBySection(section),
          builder: (context, items) => SectionListView<PsalmsTitle>(
            items: items,
            itemBuilder: (context, psalm, _) => PsalmListTile(psalm: psalm),
          ),
        ),
      ],
    );
  }
}
