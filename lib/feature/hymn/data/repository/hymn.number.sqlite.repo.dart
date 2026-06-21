import 'package:mobile/_import.dart';

class HymnNumberSqliteRepo implements IHymnNumberRepo {
  @override
  Future<int> count() async {
    try {
      final db = await openAppDatabase();
      final result = await db.rawQuery('SELECT COUNT(*) as cnt FROM tb_hymns_number');
      return (result.first['cnt'] as int?) ?? 0;
    } catch (e) {
      return 0;
    }
  }

  @override
  Future<int> countBySection(Section section) async {
    try {
      final db = await openAppDatabase();
      final result = await db.rawQuery(
        'SELECT COUNT(*) as cnt FROM tb_hymns_number hn '
        'INNER JOIN tb_hymns_group hg ON hn.hymns_group_id = hg.id '
        'WHERE hg.section_id = ?',
        [section.id],
      );
      return (result.first['cnt'] as int?) ?? 0;
    } catch (e) {
      return 0;
    }
  }

  @override
  Future<Result<List<HymnsNumber>>> findByHymnsGroup(HymnsGroup hymnsGroup) async {
    try {
      final db = await openAppDatabase();
      final rows = await db.query(
        'tb_hymns_number',
        where: 'hymns_group_id = ?',
        whereArgs: [hymnsGroup.id],
        orderBy: 'num ASC',
      );
      final list = rows.map((row) => HymnNumberMapper.toMapper(row, hymnsGroup)).toList();
      return Result.ok(list);
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }
}
