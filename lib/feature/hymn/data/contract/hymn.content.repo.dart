import 'package:mobile/_import.dart';

abstract class IHymnContentRepo {
  Future<Result<List<HymnsContent>>> findByHymnsNumber(HymnsNumber hymnsNumber);
  Future<Result<List<HymnsContent>>> search(String search, Section section);
}
