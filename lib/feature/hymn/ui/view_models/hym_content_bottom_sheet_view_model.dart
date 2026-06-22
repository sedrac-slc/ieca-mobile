import 'package:mobile/_import.dart';

class HymContentBottomSheetViewModel {

  final IHymnContentService _service;

  HymContentBottomSheetViewModel({
    IHymnContentService? service,
  }) : _service = service ?? HymnContentService();

  Future<Result<List<HymnsContent>>> findByHymnNumber(HymnsNumber hymnsNumber) async {
    return await _service.findByHymnNumber(hymnsNumber);
  }

  Future<Result<List<HymnsContent>>> search(String search, Section section) async {
    return await _service.search(search, section);
  }
}
