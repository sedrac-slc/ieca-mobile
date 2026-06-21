import 'package:flutter/material.dart';
import 'package:mobile/_import.dart';
import 'package:provider/provider.dart';

class LitanyScreen extends StatefulWidget {
  const LitanyScreen({super.key});

  @override
  State<LitanyScreen> createState() => _LitanyScreenState();
}

class _LitanyScreenState extends State<LitanyScreen> {
  late final LitanyViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = LitanyViewModel();
  }

  @override
  Widget build(BuildContext context) {
    final section = context.watch<SectionProvider>().section;
    return Column(
      children: [
        SectionFutureBuilder<LitanyTitle>(
          keyValue: section,
          future: _viewModel.findBySection(section),
          builder: (context, items) => SectionListView<LitanyTitle>(
            items: items,
            itemBuilder: (context, litany, _) => LitanyListTile(litany: litany),
          ),
        ),
      ],
    );
  }
}
