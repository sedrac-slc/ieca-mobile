import 'package:flutter/material.dart';
import 'package:mobile/_import.dart';
import 'package:provider/provider.dart';

class HymnGroupCategory extends StatefulWidget {
  const HymnGroupCategory({super.key});
  @override
  State<HymnGroupCategory> createState() => _HymnGroupCategoryState();
}

class _HymnGroupCategoryState extends State<HymnGroupCategory> {
  late final HymGroupCategoryViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = HymGroupCategoryViewModel();
  }

  @override
  Widget build(BuildContext context) {
    final section = context.watch<SectionProvider>().section;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Categorias',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Ver todos',
                style: TextStyle(color: Colors.pinkAccent),
              ),
            ),
          ],
        ),
        FutureBuilder<Result<List<HymnsGroup>>>(
          key: ValueKey(section),
          future: _viewModel.findBySection(section),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SizedBox(
                height: 100,
                child: Center(child: CircularProgressIndicator()),
              );
            }

            final result = snapshot.data;
            if (result == null) {
              return const SizedBox.shrink();
            }

            return result.when(
              ok: (groups) {
                if (groups.isEmpty) {
                  return const SizedBox.shrink();
                }

                return SizedBox(
                  height: 40,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: groups.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 10),
                    itemBuilder: (context, index) {
                      final group = groups[index];
                      return Padding(
                        padding: const EdgeInsets.all(2),
                        child: Chip(label: Text(group.name)),
                      );
                    },
                  ),
                );
              },
              error: (error) {
                return SizedBox(
                  height: 100,
                  child: Center(child: Text('Erro: $error')),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
