import 'package:flutter/material.dart';
import 'package:mobile/_import.dart';
import 'package:provider/provider.dart';

class SectionSelector extends StatefulWidget {
  final SectionViewModel? viewModel;

  const SectionSelector({
    super.key,
    this.viewModel
  });

  @override
  State<SectionSelector> createState() => _SectionSelectorState();
}

class _SectionSelectorState extends State<SectionSelector> {
  late final SectionViewModel _viewModel;
  int? _selectedId;

  @override
  void initState() {
    super.initState();
    _viewModel = widget.viewModel ?? SectionViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Section>>(
      future: _viewModel.load(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Erro: ${snapshot.error}'));
        }

        final sections = snapshot.data ?? [];

        if(sections.isEmpty) {
          return const SizedBox.shrink();
        }

        return SizedBox(
          width: 80,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<int>(
              value: _selectedId,
              hint: const Text('Seção', style: TextStyle(fontSize: 15),),
              items: sections.map((section) => DropdownMenuItem(
                value: section.id,
                child: Text(section.name, maxLines: 1, overflow: TextOverflow.ellipsis),
              )).toList(),
              onChanged: (id) {
                setState(() => _selectedId = id);
                if (id != null) {
                  final section = sections.firstWhere((s) => s.id == id);
                  context.read<SectionProvider>().updateDefault(section);
                }
              },
              isExpanded: true,
            ),
          ),
        );
      },
    );
  }
}