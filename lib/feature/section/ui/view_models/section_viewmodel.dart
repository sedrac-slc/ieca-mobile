import 'package:mobile/_import.dart';

class SectionViewModel {
  final ISectionService service;

  SectionViewModel({ISectionService? service}) : service = service ?? SectionService();

  Future<List<Section>> load() async {
    final result = await service.findAll();
    return result.when(
      ok: (sections) => sections,
      error: (e) => throw e,
    );
  }
}
