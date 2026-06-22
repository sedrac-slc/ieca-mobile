import 'package:mobile/_import.dart';

final class StringUtil {
  static String short(String content) {
    return content.length <= AppVariable.len ? content : '${content.substring(0, AppVariable.len)} ...';
  }
}