import 'package:mobile/_import.dart';

abstract class ILitanyService {
  ILitanyService({required this.repo});
  final ILitanyRepo repo;

  Future<Result<List<LitanyContent>>> findContentByLitanyTitle(LitanyTitle litanyTitle) => repo.findContentByLitanyTitle(litanyTitle);
  Future<Result<LitanyContent>> findContentFist(LitanyTitle litanyTitle) => repo.findContentFist(litanyTitle);
  Future<Result<List<LitanyTitle>>> findBySection(Section section) => repo.findBySection(section);
  Future<int> countBySection(Section section) => repo.countBySection(section);
  Future<int> count() => repo.count();
}
