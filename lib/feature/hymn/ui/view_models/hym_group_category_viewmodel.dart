import 'package:mobile/_import.dart';

class HymGroupCategoryViewModel {
  final IHymnGroupService _service;

  HymGroupCategoryViewModel({
    IHymnGroupService? service,
  }) : _service = service ?? HymnGroupService();

  Future<Result<List<HymnsGroup>>> findBySection(Section  section) async {
    return await _service.findBySection(section);
  }
}