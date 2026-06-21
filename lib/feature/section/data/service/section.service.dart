import 'package:mobile/_import.dart';

class SectionService extends ISectionService {
  SectionService({ISectionRepo? repo}): super(repo: repo ?? SectionSqliteRepo());
}
