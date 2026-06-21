import 'package:mobile/_import.dart';

class InvocationSupabase implements IInvocationRepo {
  @override
  Future<int> count() {
    // TODO: implement count
    throw UnimplementedError();
  }

  @override
  Future<int> countBySection(Section section) {
    // TODO: implement countBySection
    throw UnimplementedError();
  }

  @override
  Future<Result<List<InvocationTitle>>> findBySection(Section section) {
    // TODO: implement findBySection
    throw UnimplementedError();
  }

  @override
  Future<Result<List<InvocationContent>>> findContentByInvocation(InvocationTitle invocation) {
    // TODO: implement findContentByInvocation
    throw UnimplementedError();
  }
}
