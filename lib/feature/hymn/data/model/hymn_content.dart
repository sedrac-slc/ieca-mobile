import 'package:mobile/_import.dart';

final class HymnContentTypeStanza {
  static const String VERSE = 'VERSE';
  static const String CHOIR = 'CHOIR';
}


class HymnsContent {
  final int id;
  final int position;
  final String content;
  final String typeStanza;
  final String lang;
  final HymnsNumber hymnsNumber;

  const HymnsContent({
    required this.id,
    required this.position,
    required this.content,
    this.typeStanza = 'VERSE',
    required this.lang,
    required this.hymnsNumber,
  });
}
