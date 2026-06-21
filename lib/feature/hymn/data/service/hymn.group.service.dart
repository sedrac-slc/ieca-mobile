import 'package:mobile/_import.dart';

class HymnGroupService extends IHymnGroupService {
  HymnGroupService({IHymnGroupRepo? repo}) : super(repo: repo ?? HymnGroupSqliteRepo());
}
