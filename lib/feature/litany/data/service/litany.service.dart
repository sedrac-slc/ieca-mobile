import 'package:mobile/_import.dart';

class LitanyService extends ILitanyService {
  LitanyService({ILitanyRepo? repo}):  super(repo: repo ?? LitanySqliteRepo());
}
