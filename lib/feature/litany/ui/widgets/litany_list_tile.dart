import 'package:flutter/material.dart';
import 'package:mobile/_import.dart';

class LitanyListTile extends StatefulWidget {
  final LitanyTitle litany;

  const LitanyListTile({super.key, required this.litany});

  @override
  State<LitanyListTile> createState() => _LitanyListTileState();
}

class _LitanyListTileState extends State<LitanyListTile> {
  final _content = ValueNotifier<LitanyContent>(LitanyContentMapper.empty());
  final _viewModel = LitanyContentBottomSheetViewModel();

  Future<void> _init() async {
    final result = await _viewModel.findContentFist(widget.litany);
    _content.value = result.when(
      ok: (value) => value,
      error: (_) => LitanyContentMapper.empty(),
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
      builder: (context, value, _) {
        return PageListTile(
          number: widget.litany.position,
          title: widget.litany.name,
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
              builder: (context) => LitanyContentBottomSheet(litany: widget.litany),
            );
          },
        );
      }
    );
  }
}
