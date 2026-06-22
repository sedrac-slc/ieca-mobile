import 'package:mobile/_import.dart';

class PsalmContentBottomSheetViewModel {
  final IPsalmService _service;

  PsalmContentBottomSheetViewModel({
    IPsalmService? service,
  }) : _service = service ?? PsalmService();

  Future<Result<List<PsalmsContent>>> findContentByPsalmsTitle(PsalmsTitle psalmsTitle) async {
    return await _service.findContentByPsalmsTitle(psalmsTitle);
  }

  Future<Result<PsalmsContent>> findContentFist(PsalmsTitle psalmsTitle) async {
    return await _service.findContentFist(psalmsTitle);
  }
}
