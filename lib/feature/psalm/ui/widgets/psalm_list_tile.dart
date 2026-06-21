import 'package:flutter/material.dart';
import 'package:mobile/_import.dart';

class PsalmListTile extends StatelessWidget {
  final PsalmsTitle psalm;

  const PsalmListTile({super.key, required this.psalm});

  @override
  Widget build(BuildContext context) {
    return PageListTile(
      number: psalm.position,
      title: psalm.name,
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          useSafeArea: true,
          constraints: BoxConstraints(
            maxWidth: double.infinity,
            maxHeight: MediaQuery.of(context).size.height,
          ),
          builder: (context) => PsalmContentBottomSheet(psalm: psalm),
        );
      },
    );
  }
}
