import 'package:mobile/_import.dart';
abstract class IPsalmRepo {
  Future<Result<List<PsalmsContent>>> findContentByPsalmsTitle(PsalmsTitle psalmsTitle);
  Future<Result<PsalmsContent>> findContentFist(PsalmsTitle psalmsTitle);
  Future<Result<List<PsalmsTitle>>> findBySection(Section section);
  Future<int> countBySection(Section section);
  Future<int> count();
}
