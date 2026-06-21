import 'package:flutter/foundation.dart';
import 'package:mobile/_import.dart';

class SectionProvider extends ISectionService with ChangeNotifier {
  SectionProvider({ISectionRepo? repo})
    : super(repo: repo ?? SectionSqliteRepo()) {
    findDefault();
  }

  Section? _section;
  Section get section => _section ?? SectionMapper.empty();

  @override
  Future<Result<Section>> findDefault() async {
    final result = await super.findDefault();
    result.when(
      ok: (section) {
        if (_section == null) {
          _section = section;
          notifyListeners();
        } else if (section.id != _section?.id) {
          _section = section;
          notifyListeners();
        }
      },
      error: (e) => null,
    );
    return result;
  }

  @override
  Future<Result<void>> updateDefault(Section section) async {
    try {
      final result = await super.updateDefault(section);
      _section = section;
      notifyListeners();
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
