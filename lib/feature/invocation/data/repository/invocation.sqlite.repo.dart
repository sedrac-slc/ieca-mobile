import 'package:mobile/_import.dart';

class InvocationSqliteRepo implements IInvocationRepo {
  @override
  Future<int> count() async {
    try {
      final db = await openAppDatabase();
      final result = await db.rawQuery('SELECT COUNT(*) as cnt FROM tb_invocation_title');
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
        'SELECT COUNT(*) as cnt FROM tb_invocation_title WHERE section_id = ?',
        [section.id],
      );
      return (result.first['cnt'] as int?) ?? 0;
    } catch (e) {
      return 0;
    }
  }

  @override
  Future<Result<List<InvocationTitle>>> findBySection(Section section) async {
    try {
      final db = await openAppDatabase();
      final rows = await db.query(
        'tb_invocation_title',
        where: 'section_id = ?',
        whereArgs: [section.id],
        orderBy: 'position ASC',
      );
      final list = rows.map((row) => InvocationMapper.toMapper(row, section)).toList();
      return Result.ok(list);
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }

  @override
  Future<Result<List<InvocationContent>>> findContentByInvocation(InvocationTitle invocation) async {
    try {
      final db = await openAppDatabase();
      final rows = await db.query(
        'tb_invocation_content',
        where: 'invocation_title_id = ?',
        whereArgs: [invocation.id],
        orderBy: 'position ASC',
      );
      final list = rows.map((row) => InvocationContentMapper.toMapper(row, invocation)).toList();
      return Result.ok(list);
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }
}
