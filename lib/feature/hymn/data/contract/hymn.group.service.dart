import 'package:mobile/_import.dart';

abstract class IHymnGroupService {
  IHymnGroupService({required this.repo});
  final IHymnGroupRepo repo;

  Future<Result<List<HymnsGroup>>> findBySection(Section section) => repo.findBySection(section);
}
