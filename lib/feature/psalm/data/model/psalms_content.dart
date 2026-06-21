import 'package:mobile/_import.dart';

class PsalmsContent {
  final int id;
  final String person;
  final String content;
  final int position;
  final PsalmsTitle psalm;

  const PsalmsContent({
    required this.id,
    required this.person,
    required this.content,
    required this.position,
    required this.psalm,
  });
}
