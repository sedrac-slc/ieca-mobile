import 'package:mobile/_import.dart';

class HymnsGroup {
  final int id;
  final String name;
  final int beginning;
  final int finished;
  final Section section;
  const HymnsGroup({
    required this.id,
    required this.name,
    required this.beginning,
    required this.finished,
    required this.section,
  });

  @override
  String toString() {
    return 'HymnsGroup{id: $id, name: $name, beginning: $beginning, finished: $finished, section: $section}';
  }
}
