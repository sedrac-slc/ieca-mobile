import 'package:mobile/_import.dart';

abstract class IHymnContentService {
  IHymnContentService({required this.repo});
  final IHymnContentRepo repo;

  Future<Result<List<HymnsContent>>> findByHymnNumber(HymnsNumber hymnsNumber) => repo.findByHymnsNumber(hymnsNumber);
}
