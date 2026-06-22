import 'package:mobile/_import.dart';

abstract class IHymnContentService {
  IHymnContentService({required this.repo});
  final IHymnContentRepo repo;

  Future<Result<List<HymnsContent>>> findByHymnNumber(HymnsNumber hymnsNumber) => repo.findByHymnsNumber(hymnsNumber);
  Future<Result<List<HymnsContent>>> search(String search, Section section) => repo.search(search, section);
}
