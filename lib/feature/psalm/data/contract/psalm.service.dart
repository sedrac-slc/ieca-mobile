import 'package:mobile/_import.dart';
abstract class IPsalmService {
  IPsalmService({required this.repo});
  final IPsalmRepo repo;

  Future<Result<List<PsalmsTitle>>> findBySection(Section section) => repo.findBySection(section);
  Future<Result<List<PsalmsContent>>> findContentByPsalmsTitle(PsalmsTitle psalmsTitle) => repo.findContentByPsalmsTitle(psalmsTitle);
  Future<int> countBySection(Section section) => repo.countBySection(section);
  Future<int> count() => repo.count();
}
