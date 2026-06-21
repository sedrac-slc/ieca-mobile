import 'package:mobile/_import.dart';

abstract class IInvocationRepo {
  Future<Result<List<InvocationContent>>> findContentByInvocation(InvocationTitle invocation);

  Future<Result<List<InvocationTitle>>> findBySection(Section section);

  Future<int> countBySection(Section section);
  Future<int> count();
}
