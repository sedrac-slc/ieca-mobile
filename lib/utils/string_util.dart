import 'package:mobile/_import.dart';

final class StringUtil {
  static String short(String content) {
    return content.length <= AppVariable.len ? content : '${content.substring(0, AppVariable.len)} ...';
  }

  static String replaceContent(String content) {
    return content.replaceAll('\\n', '\n');
  }

  static String getPersonLabel(String person) {
    if(person == "DIRECTOR") return "Direção";
    if(person == "CONGREGATION") return "Congregação";
    if(person == "DIRECTOR_CONGREGATION") return "Direção e congregação";
    return "";
  }
}