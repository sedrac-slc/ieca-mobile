import 'package:mobile/_import.dart';

class SectionSqliteRepo implements ISectionRepo {
  @override
  Future<Result<List<Section>>> findAll() async {
    try {
      final db = await openAppDatabase();
      final rows = await db.query('tb_sections', orderBy: 'name ASC');
      final sections = rows.map(SectionMapper.toMapper).toList();
      return Result.ok(sections);
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }

  @override
  Future<Result<Section>> findDefault() async {
    try {
      final db = await openAppDatabase();
      final rows = await db.query(
        'tb_sections',
        where: 'is_active = ?',
        whereArgs: [1],
        limit: 1,
      );
      if (rows.isEmpty) {
        return Result.error(Exception("Nenhuma seção padrão encontrada."));
      }
      final section = SectionMapper.toMapper(rows.first);
      return Result.ok(section);
    } catch (e) {
      return Result.error(Exception("Erro ao buscar seção padrão: $e"));
    }
  }

  @override
  Future<Result<void>> updateDefault(Section section) async {
    try {
      final db = await openAppDatabase();

      await db.transaction((txn) async {
        await txn.update('tb_sections', {'is_active': 0});
        await txn.update(
          'tb_sections',
          {'is_active': 1},
          where: 'id = ?',
          whereArgs: [section.id],
        );
      });

      return Result.ok(null);
    } catch (e) {
      return Result.error(Exception("Erro ao atualizar seção padrão: $e"));
    }
  }
}
