import 'package:flutter/material.dart';
import 'package:mobile/_import.dart';

class InvocationListTile extends StatelessWidget {
  final InvocationTitle invocation;
  const InvocationListTile({super.key, required this.invocation});

  @override
  Widget build(BuildContext context) {
    return PageListTile(
      number: invocation.position,
      title: invocation.name,
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          useSafeArea: true,
          constraints: BoxConstraints(
            maxWidth: double.infinity,
            maxHeight: MediaQuery.of(context).size.height,
          ),
          builder: (context) => InvocationContentBottomSheet(invocation: invocation),
        );
      },
    );
  }
}
