
import 'package:mobile/_import.dart';

final class InvocationMapper {
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