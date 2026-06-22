import 'package:flutter/material.dart';
import 'package:mobile/_import.dart';

class PsalmListTile extends StatefulWidget {
  final PsalmsTitle psalm;

  const PsalmListTile({super.key, required this.psalm});

  @override
  State<PsalmListTile> createState() => _PsalmListTileState();
}

class _PsalmListTileState extends State<PsalmListTile> {
  final _content = ValueNotifier<PsalmsContent>(PsalmsContentMapper.empty());
  final _viewModel = PsalmContentBottomSheetViewModel();

  Future<void> _init() async {
    final result = await _viewModel.findContentFist(widget.psalm);
    _content.value = result.when(
      ok: (value) => value,
      error: (_) => PsalmsContentMapper.empty(),
    );
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void dispose() {
    _content.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _content,
      builder: (context, value, child) {
        return PageListTile(
          number: widget.psalm.position,
          title: widget.psalm.name,
          subtitle: StringUtil.short(value.content),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              useSafeArea: true,
              constraints: BoxConstraints(
                maxWidth: double.infinity,
                maxHeight: MediaQuery.of(context).size.height,
              ),
              builder: (context) => PsalmContentBottomSheet(psalm: widget.psalm),
            );
          },
        );
      }
    );
  }
}
