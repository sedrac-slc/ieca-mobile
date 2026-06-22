import 'package:mobile/_import.dart';

class InvocationViewModel {
  final IInvocationService _service;

  InvocationViewModel({
    IInvocationService? service,
  }) : _service = service ?? InvocationService();

  Future<Result<List<InvocationTitle>>> findBySection(Section section) async {
    return await _service.findBySection(section);
  }
}
