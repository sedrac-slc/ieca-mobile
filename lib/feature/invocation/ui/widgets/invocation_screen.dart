import 'package:flutter/material.dart';
import 'package:mobile/_import.dart';
import 'package:provider/provider.dart';
class InvocationScreen extends StatefulWidget {
  const InvocationScreen({super.key});
  @override
  State<InvocationScreen> createState() => _InvocationScreenState();
}
class _InvocationScreenState extends State<InvocationScreen> {
  late final InvocationViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = InvocationViewModel();
  }
  @override
  Widget build(BuildContext context) {
    final section = context.watch<SectionProvider>().section;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          SearchInput(),
          SectionFutureBuilder<InvocationTitle>(
            keyValue: section,
            future: _viewModel.findBySection(section),
            builder: (context, items) => SectionListView<InvocationTitle>(
              items: items,
              itemBuilder: (context, invocation, _) => InvocationListTile(invocation: invocation),
            ),
          ),
        ],
      ),
    );
  }
}
