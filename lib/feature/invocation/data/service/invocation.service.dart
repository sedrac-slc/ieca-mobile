import 'package:mobile/_import.dart';

class InvocationService extends IInvocationService {
  InvocationService({IInvocationRepo? repo}) : super(repo: repo ?? InvocationSqliteRepo());
}
