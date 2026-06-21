import 'package:mobile/_import.dart';

class HymnGroupSupabase implements IHymnGroupRepo {
  @override
  Future<Result<List<HymnsGroup>>> findBySection(Section section) {
    throw UnimplementedError();
  }
}
