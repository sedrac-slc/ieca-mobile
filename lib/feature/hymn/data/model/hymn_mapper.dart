import 'package:mobile/_import.dart';

final class HymnGroupMapper {
  static HymnsGroup toMapper(Map<String, Object?> row, Section section) {
    return HymnsGroup(
      id: row['id'] as int,
      name: row['name'] as String,
      beginning: row['beginning'] as int,
      finished: row['finished'] as int,
      section: section,
    );
  }
}

final class HymnNumberMapper {
  static HymnsNumber toMapper(Map<String, Object?> row, HymnsGroup hymnsGroup) {
    return HymnsNumber(
      id: row['id'] as int,
      label: row['label'] as String,
      code: row['code'] as String,
      num: row['num'] as int,
      hymnsGroup: hymnsGroup,
    );
  }
}

final class HymnContentMapper {
  static HymnsContent toMapper(Map<String, Object?> row, HymnsNumber hymnsNumber) {
    return HymnsContent(
      id: row['id'] as int,
      typeStanza: row['type_stanza'] as String,
      content: row['content'] as String,
      position: row['position'] as int,
      lang: row['lang'] as String,
      hymnsNumber: hymnsNumber,
    );
  }
}