import 'package:mobile/_import.dart';

abstract class ISectionRepo {
  Future<Result<List<Section>>> findAll();
  Future<Result<Section>> findDefault();
  Future<Result<void>> updateDefault(Section section);
}
