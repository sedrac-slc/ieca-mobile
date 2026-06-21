import 'package:mobile/_import.dart';

abstract class IHymnNumberRepo {
  Future<Result<List<HymnsNumber>>> findByHymnsGroup(HymnsGroup hymnsGroup);
  Future<int> countBySection(Section section);
  Future<int> count();
}