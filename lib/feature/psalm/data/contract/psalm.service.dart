import 'package:mobile/_import.dart';
abstract class IPsalmService {
  IPsalmService({required this.repo});
  final IPsalmRepo repo;

  Future<Result<List<PsalmsContent>>> findContentByPsalmsTitle(PsalmsTitle psalmsTitle) => repo.findContentByPsalmsTitle(psalmsTitle);
  Future<Result<PsalmsContent>> findContentFist(PsalmsTitle psalmsTitle) => repo.findContentFist(psalmsTitle);
  Future<Result<List<PsalmsTitle>>> findBySection(Section section) => repo.findBySection(section);
  Future<int> countBySection(Section section) => repo.countBySection(section);
  Future<int> count() => repo.count();
}
