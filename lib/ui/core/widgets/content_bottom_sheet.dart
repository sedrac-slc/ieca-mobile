import 'package:flutter/material.dart';
import 'package:mobile/_import.dart';

class ContentBottomSheet<T> extends StatelessWidget {
  final String title;
  final Future<Result<List<T>>> future;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;

  const ContentBottomSheet({
    super.key,
    required this.title,
    required this.future,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(4, 8, 8, 0),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: FutureBuilder<Result<List<T>>>(
              future: future,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                final result = snapshot.data;
                if (result == null) {
                  return const Center(child: Text('Nenhum dado encontrado'));
                }
                return result.when(
                  ok: (data) {
                    if (data.isEmpty) {
                      return const Center(child: Text('Nenhum conteúdo encontrado'));
                    }
                    return ListView.separated(
                      padding: const EdgeInsets.all(16),
                      itemBuilder: (context, index) => itemBuilder(context, data[index], index),
                      separatorBuilder: (context, index) => const SizedBox(height: 8),
                      itemCount: data.length,
                    );
                  },
                  error: (error) => Center(child: Text('Erro: $error')),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
