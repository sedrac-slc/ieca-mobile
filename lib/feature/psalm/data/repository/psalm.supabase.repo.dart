import 'package:mobile/_import.dart';

class PsalmSupabase implements IPsalmRepo {
  @override
  Future<int> count() {
    // TODO: implement count
    throw UnimplementedError();
  }

  @override
  Future<int> countBySection(Section section) {
    // TODO: implement countBySection
    throw UnimplementedError();
  }

  @override
  Future<Result<List<PsalmsTitle>>> findBySection(Section section) {
    // TODO: implement findBySection
    throw UnimplementedError();
  }

  @override
  Future<Result<List<PsalmsContent>>> findContentByPsalmsTitle(PsalmsTitle psalmsTitle) {
    // TODO: implement findContentByPsalmsTitle
    throw UnimplementedError();
  }
}
