import 'package:mobile/_import.dart';

abstract class ILitanyRepo {
  Future<Result<List<LitanyContent>>> findContentByLitanyTitle(LitanyTitle litanyTitle);
  Future<Result<LitanyContent>> findContentFist(LitanyTitle litanyTitle);
  Future<Result<List<LitanyTitle>>> findBySection(Section section);
  Future<int> countBySection(Section section);
  Future<int> count();
}
