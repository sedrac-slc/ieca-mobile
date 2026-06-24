import 'package:mobile/_import.dart';

class HymnGroupSqliteRepo implements IHymnGroupRepo {
  @override
  Future<Result<List<HymnsGroup>>> findBySection(Section section) async {
    try {
      final db = await openAppDatabase();
      final rows = await db.query(
        'tb_hymns_group',
        where: 'section_id = ? AND type = ?',
        whereArgs: [section.id, HymnNumberType.NORMAL],
        orderBy: 'id ASC',
      );
      final groups = rows.map((row) => HymnGroupMapper.toMapper(row, section)).toList();
      return Result.ok(groups);
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }
}
