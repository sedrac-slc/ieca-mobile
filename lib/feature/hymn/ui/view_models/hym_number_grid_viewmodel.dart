import 'package:mobile/_import.dart';

class HymNumberGridViewModel {
  final IHymnNumberService _service;

  HymNumberGridViewModel({
    IHymnNumberService? service,
  }) : _service = service ?? HymnNumberService();

  Future<Result<List<HymnsNumber>>> findByHymnsGroup(HymnsGroup  hymnsGroup) async {
    return await _service.findByHymnsGroup(hymnsGroup);
  }
}