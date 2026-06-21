import 'package:mobile/_import.dart';

class LitanyViewModel {
  final ILitanyService _service;

  LitanyViewModel({
    ILitanyService? service,
  }) : _service = service ?? LitanyService();

  Future<Result<List<LitanyTitle>>> findBySection(Section section) async {
    return await _service.findBySection(section);
  }
}