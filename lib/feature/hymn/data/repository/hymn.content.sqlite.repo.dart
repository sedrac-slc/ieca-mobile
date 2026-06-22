import 'package:mobile/_import.dart';

class HymnContentSqliteRepo implements IHymnContentRepo {
  @override
  Future<Result<List<HymnsContent>>> findByHymnsNumber(
    HymnsNumber hymnsNumber,
  ) async {
    try {
      final db = await openAppDatabase();
      final rows = await db.query(
        'tb_hymns_content',
        where: 'hymns_number_id = ?',
        whereArgs: [hymnsNumber.id],
        orderBy: 'position ASC',
      );
      final groups = rows
          .map((row) => HymnContentMapper.toMapper(row, hymnsNumber))
          .toList();
      return Result.ok(groups);
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }

  @override
  Future<Result<List<HymnsContent>>> search(
    String search,
    Section section,
  ) async {
    try {
      final db = await openAppDatabase();

      final rows = await db.rawQuery(
        '''
      SELECT 
        c.*, 
        n.id as n_id, n.num as n_num, n.code as n_code, n.label as n_label,
        g.id as g_id, g.name as g_name, g.beginning as g_beginning, g.finished as g_finished
      FROM tb_hymns_content c
      INNER JOIN tb_hymns_number n ON c.hymns_number_id = n.id
      INNER JOIN tb_hymns_group g ON n.hymns_group_id = g.id
      WHERE c.content LIKE ? AND g.section_id = ?
      GROUP BY c.hymns_number_id
      ORDER BY c.position ASC
    ''',
        ['%$search%', section.id],
      );

      final results = rows.map((row) {
        final group = HymnsGroup(
          id: row['g_id'] as int,
          name: row['g_name'] as String,
          beginning: row['g_beginning'] as int,
          finished: row['g_finished'] as int,
          section: section,
        );

        final number = HymnsNumber(
          id: row['n_id'] as int,
          num: row['n_num'] as int,
          code: row['n_code'] as String,
          label: row['n_label'] as String,
          hymnsGroup: group,
        );

        return HymnContentMapper.toMapper(row, number);
      }).toList();

      return Result.ok(results);
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }
}
