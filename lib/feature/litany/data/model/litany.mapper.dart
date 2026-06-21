
import 'package:mobile/_import.dart';

final class LitanyMapper {
  static LitanyTitle toMapper(Map<String, Object?> row, Section section) {
    return LitanyTitle(
      id: row['id'] as int,
      name: row['name'] as String,
      position: row['position'] as int,
      section: section,
    );
  }
}

final class LitanyContentMapper {
  static LitanyContent toMapper(Map<String, Object?> row, LitanyTitle litanyTitle) {
    return LitanyContent(
      id: row['id'] as int,
      person: row['person'] as String,
      content: row['content'] as String,
      books: row['books'] as String?,
      litany: litanyTitle,
    );
  }
}