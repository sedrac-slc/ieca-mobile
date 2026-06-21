import 'package:mobile/_import.dart';

class InvocationContent {
  final int id;
  final String content;
  final int position;
  final String? books;
  final InvocationTitle invocation;

  const InvocationContent({
    required this.id,
    required this.content,
    required this.position,
    required this.invocation,
    this.books,
  });
}
