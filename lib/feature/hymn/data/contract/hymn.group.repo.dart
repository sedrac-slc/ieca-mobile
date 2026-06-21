import 'package:mobile/_import.dart';

abstract class IHymnGroupRepo {
  Future<Result<List<HymnsGroup>>> findBySection(Section section);
}
