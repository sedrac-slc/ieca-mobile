import 'package:mobile/_import.dart';

abstract class ILitanyRepo {
  Future<Result<List<LitanyTitle>>> findBySection(Section section);
  Future<Result<List<LitanyContent>>> findContentByLitanyTitle(LitanyTitle litanyTitle);
  Future<int> countBySection(Section section);
  Future<int> count();
}
