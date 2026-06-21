import 'package:mobile/_import.dart';

abstract class IHymnNumberService {
  IHymnNumberService({required this.repo});
  final IHymnNumberRepo repo;

  Future<int> count() => repo.count();

  Future<int> countBySection(Section section) => repo.countBySection(section);

  Future<Result<List<HymnsNumber>>> findByHymnsGroup(HymnsGroup hymnsGroup) => repo.findByHymnsGroup(hymnsGroup);
}
