import 'package:flutter/material.dart';
import 'package:mobile/_import.dart';

class SectionFutureBuilder<T> extends StatelessWidget {
  final Future<Result<List<T>>>? future;
  final Object? keyValue;
  final Widget Function(BuildContext, List<T>) builder;

  const SectionFutureBuilder({
    super.key,
    required this.future,
    this.keyValue,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Result<List<T>>>(
      key: keyValue != null ? ValueKey(keyValue) : null,
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            height: 100,
            child: Center(child: CircularProgressIndicator()),
          );
        }

        final result = snapshot.data;
        if (result == null) {
          return const NoResultsView();
        }

        return result.when(
          ok: (data) {
            if (data.isEmpty) {
              return const NoResultsView();
            }
            return builder(context, data);
          },
          error: (error) {
            return SizedBox(
              height: 100,
              child: Center(child: Text('Erro: $error')),
            );
          },
        );
      },
    );
  }
}

class NoResultsView extends StatelessWidget {
  const NoResultsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppIcon.noResults,
          const SizedBox(height: 24),

          const Text(
            "Nenhum informação encontrado",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),

          const Text(
            "Não encontramos resultados para sua busca. Tente verificar a seção do hinário que esta activo.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 32),

          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color(0xFFE91E63),
              side: const BorderSide(color: Color(0xFFE91E63)),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            ),
            child: const Text("Tentar novamente"),
          ),
        ],
      ),
    );
  }
}