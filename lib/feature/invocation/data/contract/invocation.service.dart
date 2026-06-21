import 'package:mobile/_import.dart';
abstract class IInvocationService {
  IInvocationService({required this.repo});
  final IInvocationRepo repo;

  Future<Result<List<InvocationContent>>> findContentByInvocation(InvocationTitle invocation) => repo.findContentByInvocation(invocation);
  Future<Result<List<InvocationTitle>>> findBySection(Section section) => repo.findBySection(section);
  Future<int> countBySection(Section section) => repo.countBySection(section);
  Future<int> count() => repo.count();
}
