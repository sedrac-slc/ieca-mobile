import 'package:mobile/_import.dart';

class HymnScreenViewmodel {
  final _hymContentBottomSheetViewModel = HymContentBottomSheetViewModel();
  final _hymGroupCategoryViewModel = HymGroupCategoryViewModel();

  Future<Result<List<HymnsContent>>> search(String search, Section section) async {
    return _hymContentBottomSheetViewModel.search(search, section);
  }

  Future<Result<List<HymnsGroup>>> findBySection(Section  section) async {
    return _hymGroupCategoryViewModel.findBySection(section);
  }
}