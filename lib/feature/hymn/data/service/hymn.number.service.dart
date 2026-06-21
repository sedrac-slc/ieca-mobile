import 'package:mobile/_import.dart';

class HymnNumberService extends IHymnNumberService {
  HymnNumberService({IHymnNumberRepo? repo}) : super(repo: repo ?? HymnNumberSqliteRepo());
}
