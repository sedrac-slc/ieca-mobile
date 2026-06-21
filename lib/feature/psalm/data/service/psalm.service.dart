import 'package:mobile/_import.dart';

class PsalmService extends IPsalmService {
  PsalmService({IPsalmRepo? repo}) : super(repo: repo ?? PsalmSqliteRepo());
}
