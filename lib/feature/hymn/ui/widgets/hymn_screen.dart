import 'package:flutter/material.dart';
import 'package:mobile/_import.dart';
import 'package:provider/provider.dart';

final class _HymnTab {
  static const String LIST = 'LIST';
  static const String SEARCH = 'SEARCH';
}

class HymnScreen extends StatefulWidget {
  const HymnScreen({super.key});
  @override
  State<HymnScreen> createState() => _HymnScreenState();
}

class _HymnScreenState extends State<HymnScreen> {
  final ValueNotifier<String> _tab = ValueNotifier(_HymnTab.LIST);
  final TextEditingController _search = TextEditingController();
  final HymnScreenViewmodel _viewModel = HymnScreenViewmodel();
  Future<Result<List<HymnsContent>>>? _searchResults;

  void _onSearchRest() {
    _searchResults = Future.value(Result.ok([]));
    _search.clear();
    _tab.value = _HymnTab.LIST;
  }

  void _onSearchChanged(String value, Section section) {
    if (value.isEmpty) {
      _tab.value = _HymnTab.LIST;
    } else {
      _tab.value = _HymnTab.SEARCH;
      _searchResults = _viewModel.search(value, section);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final section = context.watch<SectionProvider>().section;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ValueListenableBuilder(
        valueListenable: _tab,
        builder: (context, value, child) {
          return Column(
            children: [
              SearchInput(
                controller: _search,
                onReset: _onSearchRest,
                onChanged: (v) => _onSearchChanged(v, section),
              ),
              if (value == _HymnTab.LIST) ...[
                Expanded(
                  child: FutureBuilder<Result<List<HymnsGroup>>>(
                    key: ValueKey(section),
                    future: _viewModel.findBySection(section),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return snapshot.data?.when(
                            ok: (data) {
                              if (data.isEmpty) return const SizedBox.shrink();
                              final children = <Widget>[];
                              for (int i = 0; i < data.length; i++) {
                                if (i > 0) {
                                  children.add(const SizedBox(height: 10));
                                }
                                children.add(
                                  HymnNumberGrid(hymnsGroup: data[i]),
                                );
                              }
                              return SingleChildScrollView(
                                child: Column(children: children),
                              );
                            },
                            error: (error) =>
                                Center(child: Text('Erro: $error')),
                          ) ??
                          const SizedBox.shrink();
                    },
                  ),
                ),
              ] else ...[
                Expanded(
                  child: FutureBuilder<Result<List<HymnsContent>>>(
                    future: _searchResults,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      final result = snapshot.data;
                      return result?.when(
                            ok: (data) {
                              if (data.isEmpty) {
                                return const Center(
                                  child: Text("Nenhum hino encontrado."),
                                );
                              }
                              return ListView.builder(
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  final item = data[index];
                                  return ListTile(
                                    title: Text(
                                      "${item.hymnsNumber.num} - ${item.hymnsNumber.label}",
                                    ),
                                    subtitle: Text(
                                      StringUtil.replaceContent(item.content),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        useSafeArea: true,
                                        constraints: BoxConstraints(
                                          maxWidth: double.infinity,
                                          maxHeight: MediaQuery.of(
                                            context,
                                          ).size.height,
                                        ),
                                        builder: (context) =>
                                            HymnContentBottomSheet(
                                              hymnNumber: item.hymnsNumber,
                                            ),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                            error: (e) => Center(child: Text('Erro: $e')),
                          ) ??
                          const SizedBox.shrink();
                    },
                  ),
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}
