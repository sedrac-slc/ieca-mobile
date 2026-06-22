import 'package:mobile/_import.dart';

class LitanySqliteRepo implements ILitanyRepo {

  @override
  Future<int> count() async {
    try {
      final db = await openAppDatabase();
      final result = await db.rawQuery('SELECT COUNT(*) as cnt FROM tb_litany_title');
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
        'SELECT COUNT(*) as cnt FROM tb_litany_title WHERE section_id = ?',
        [section.id],
      );
      return (result.first['cnt'] as int?) ?? 0;
    } catch (e) {
      return 0;
    }
  }


  @override
  Future<Result<List<LitanyTitle>>> findBySection(Section section) async {
    try {
      final db = await openAppDatabase();
      final rows = await db.query(
        'tb_litany_title',
        where: 'section_id = ?',
        whereArgs: [section.id],
        orderBy: 'position ASC',
      );
      final list = rows.map((row) => LitanyMapper.toMapper(row, section)).toList();
      return Result.ok(list);
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }

  @override
  Future<Result<List<LitanyContent>>> findContentByLitanyTitle(LitanyTitle litanyTitle) async {
    try {
      final db = await openAppDatabase();
      final rows = await db.query(
        'tb_litany_content',
        where: 'litany_title_id = ?',
        whereArgs: [litanyTitle.id],
      );
      final list = rows.map((row) => LitanyContentMapper.toMapper(row, litanyTitle)).toList();
      return Result.ok(list);
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }

  @override
  Future<Result<LitanyContent>> findContentFist(LitanyTitle litanyTitle) async {
    try {
      final db = await openAppDatabase();
      final rows = await db.query(
        'tb_litany_content',
        where: 'litany_title_id = ?',
        whereArgs: [litanyTitle.id],
      );
      if (rows.isEmpty) return Result.error(Exception('No content found'));
      return Result.ok(LitanyContentMapper.toMapper(rows.first, litanyTitle));
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }
}
