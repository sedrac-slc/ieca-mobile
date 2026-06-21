import 'package:mobile/_import.dart';

abstract class ILitanyService {
  ILitanyService({required this.repo});
  final ILitanyRepo repo;

  Future<int> count() => repo.count();
  Future<int> countBySection(Section section) => repo.countBySection(section);
  Future<Result<List<LitanyTitle>>> findBySection(Section section) => repo.findBySection(section);
  Future<Result<List<LitanyContent>>> findContentByLitanyTitle(LitanyTitle litanyTitle) => repo.findContentByLitanyTitle(litanyTitle);
}
