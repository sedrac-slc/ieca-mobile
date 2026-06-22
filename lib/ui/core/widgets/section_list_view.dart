import 'package:flutter/material.dart';

class SectionListView<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(BuildContext, T, int) itemBuilder;

  const SectionListView({
    super.key,
    required this.items,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: items.length,
        separatorBuilder: (_, _) => const SizedBox(height: 5),
        itemBuilder: (context, index) {
          final item = items[index];
          return Padding(
            padding: const EdgeInsets.only(top: 2),
            child: itemBuilder(context, item, index),
          );
        },
      ),
    );
  }
}
