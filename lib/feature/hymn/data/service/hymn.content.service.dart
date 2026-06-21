import 'package:mobile/_import.dart';

class HymnContentService extends IHymnContentService {
  HymnContentService({IHymnContentRepo? repo}) : super(repo: repo ?? HymnContentSqliteRepo());
}
