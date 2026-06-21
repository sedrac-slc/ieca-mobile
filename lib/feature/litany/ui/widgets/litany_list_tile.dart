import 'package:flutter/material.dart';
import 'package:mobile/_import.dart';

class LitanyListTile extends StatelessWidget {
  final LitanyTitle litany;

  const LitanyListTile({super.key, required this.litany});

  @override
  Widget build(BuildContext context) {
    return PageListTile(
      number: litany.position,
      title: litany.name,
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          useSafeArea: true,
          constraints: BoxConstraints(
            maxWidth: double.infinity,
            maxHeight: MediaQuery.of(context).size.height,
          ),
          builder: (context) => LitanyContentBottomSheet(litany: litany),
        );
      },
    );
  }
}
