
import 'package:mobile/_import.dart';

final class LitanyMapper {

  static LitanyTitle empty() {
    return LitanyTitle(id: 0, name: "", position: 0, section: SectionMapper.empty(),);
  }

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
  static LitanyContent empty() {
    return LitanyContent(id: 0, person: "", content: "", books: "", litany: LitanyMapper.empty(),);
  }

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