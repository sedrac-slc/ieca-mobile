import 'package:mobile/_import.dart';

class LitanyContent {
  final int id;
  final String person;
  final String content;
  final String? books;
  final LitanyTitle litany;

  const LitanyContent({
    required this.id,
    required this.person,
    required this.content,
    this.books,
    required this.litany,
  });
}
