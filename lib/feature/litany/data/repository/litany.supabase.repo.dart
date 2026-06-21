import 'package:mobile/_import.dart';

class LitanySupabase implements ILitanyRepo {

  @override
  Future<int> count() {
    // TODO: implement count
    throw UnimplementedError();
  }

  @override
  Future<Result<List<LitanyTitle>>> findBySection(Section section) {
    // TODO: implement findBySection
    throw UnimplementedError();
  }

  @override
  Future<int> countBySection(Section section) {
    // TODO: implement countBySection
    throw UnimplementedError();
  }

  @override
  Future<Result<List<LitanyContent>>> findContentByLitanyTitle(LitanyTitle litanyTitle) {
    // TODO: implement findContentByLitanyTitle
    throw UnimplementedError();
  }
}
