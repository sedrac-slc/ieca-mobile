import 'package:mobile/_import.dart';

class HymnContentSqliteRepo implements IHymnContentRepo {
  @override
  Future<Result<List<HymnsContent>>> findByHymnsNumber(HymnsNumber hymnsNumber) async {
    try {
      final db = await openAppDatabase();
      final rows = await db.query(
        'tb_hymns_content',
        where: 'hymns_number_id = ?',
        whereArgs: [hymnsNumber.id],
        orderBy: 'position ASC',
      );
      final groups = rows.map((row) => HymnContentMapper.toMapper(row, hymnsNumber)).toList();
      return Result.ok(groups);
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }
}
