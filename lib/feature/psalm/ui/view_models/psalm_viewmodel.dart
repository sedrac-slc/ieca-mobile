import 'package:mobile/_import.dart';
class PsalmViewModel {

  final IPsalmService _service;
  PsalmViewModel({
    IPsalmService? service,
  }) : _service = service ?? PsalmService();

  Future<Result<List<PsalmsTitle>>> findBySection(Section section) async {
    return await _service.findBySection(section);
  }  
}
