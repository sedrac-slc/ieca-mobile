import 'package:mobile/_import.dart';

class HymnsNumber {
  final int id;
  final int num;
  final String code;
  final String label;
  final HymnsGroup hymnsGroup;

  const HymnsNumber({
    required this.id,
    required this.num,
    required this.code,
    required this.label,
    required this.hymnsGroup,
  });

  @override
  String toString() {
    return 'HymnsNumber{id: $id, num: $num, code: $code, label: $label, hymnsGroup: $hymnsGroup}';
  }
}
