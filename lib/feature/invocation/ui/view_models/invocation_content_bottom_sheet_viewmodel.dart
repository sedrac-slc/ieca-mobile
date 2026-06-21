
import 'package:mobile/_import.dart';

class InvocationContentBottomSheetViewModel {
  final IInvocationService _service;

  InvocationContentBottomSheetViewModel({
    IInvocationService? service,
  }) : _service = service ?? InvocationService();

  Future<Result<List<InvocationContent>>> findContentByInvocation(InvocationTitle invocation) async {
    return await _service.findContentByInvocation(invocation);
  }

}