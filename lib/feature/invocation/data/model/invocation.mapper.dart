
import 'package:mobile/_import.dart';

final class InvocationMapper {
  static InvocationTitle empty() {
    return InvocationTitle(id: 0, name: "", position: 0, section: SectionMapper.empty());
  }

  static InvocationTitle toMapper(Map<String, Object?> row, Section section) {
    return InvocationTitle(
      id: row['id'] as int,
      name: row['name'] as String,
      position: row['position'] as int,
      section: section,
    );
  }
}

final class InvocationContentMapper {
  static InvocationContent empty() {
    return InvocationContent(id: 0, content: "", books: "", position: 0, invocation: InvocationMapper.empty(),);
  }

  static InvocationContent toMapper(Map<String, Object?> row, InvocationTitle invocation) {
    return InvocationContent(
      id: row['id'] as int,
      content: row['content'] as String,
      books: row['books'] as String,
      position: row['position'] as int,
      invocation: invocation,
    );
  }
}