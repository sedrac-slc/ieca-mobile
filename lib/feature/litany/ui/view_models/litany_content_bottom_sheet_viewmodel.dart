import 'package:mobile/_import.dart';

class LitanyContentBottomSheetViewModel {
  final ILitanyService _service;

  LitanyContentBottomSheetViewModel({
    ILitanyService? service,
  }) : _service = service ?? LitanyService();

  Future<Result<List<LitanyContent>>> findContentByLitanyTitle(LitanyTitle litanyTitle) async {
    return await _service.findContentByLitanyTitle(litanyTitle);
  }

  Future<Result<LitanyContent>> findContentFist(LitanyTitle litanyTitle) async {
    return await _service.findContentFist(litanyTitle);
  }
}
