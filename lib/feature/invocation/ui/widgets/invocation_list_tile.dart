import 'package:flutter/material.dart';
import 'package:mobile/_import.dart';

class InvocationListTile extends StatefulWidget {
  final InvocationTitle invocation;

  const InvocationListTile({super.key, required this.invocation});

  @override
  State<InvocationListTile> createState() => _InvocationListTileState();
}

class _InvocationListTileState extends State<InvocationListTile> {
  final _content = ValueNotifier<InvocationContent>(InvocationContentMapper.empty());
  final _viewModel = InvocationContentBottomSheetViewModel();

  Future<void> _init() async {
    final result = await _viewModel.findContentFist(widget.invocation);
    if (!mounted) return;
    _content.value = result.when(
      ok: (value) => value,
      error: (_) => InvocationContentMapper.empty(),
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
    return ValueListenableBuilder<InvocationContent>(
      valueListenable: _content,
      builder: (context, value, _) => PageListTile(
        number: widget.invocation.position,
        title: widget.invocation.name,
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
            builder: (context) => InvocationContentBottomSheet(invocation: widget.invocation),
          );
        },
      ),
    );
  }
}
