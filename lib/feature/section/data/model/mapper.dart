import 'package:mobile/_import.dart';

final class SectionMapper {

  static Section toMapper(Map<String, Object?> row) {
    return Section(
      id: row['id'] as int,
      code: row['code'] as String,
      name: row['name'] as String,
      isActive: row['is_active'] as int,
    );
  }

  static Section empty() {
    return Section(
      id: 1,
      code: "PT",
      name: "Português",
      isActive: 1,
    );
  }

}