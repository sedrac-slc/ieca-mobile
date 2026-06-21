import 'package:mobile/_import.dart';
abstract class IPsalmRepo {
  Future<Result<List<PsalmsTitle>>> findBySection(Section section);
  Future<Result<List<PsalmsContent>>> findContentByPsalmsTitle(PsalmsTitle psalmsTitle);
  Future<int> countBySection(Section section);
  Future<int> count();
}
