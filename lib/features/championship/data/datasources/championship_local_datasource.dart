import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../../../../core/database/app_database.dart';
import '../models/championship_model.dart';

class ChampionshipLocalDataSource {
  ChampionshipLocalDataSource(this._database);

  final AppDatabase _database;

  Future<List<ChampionshipModel>> list() async {
    final db = await _database.database;
    final rows = await db.query('championships', orderBy: 'updated_at DESC');
    return rows.map(ChampionshipModel.fromMap).toList();
  }

  Future<int> create(ChampionshipModel championship) async {
    final db = await _database.database;
    final maxId = Sqflite.firstIntValue(await db.rawQuery('SELECT COALESCE(MAX(id), 0) + 1 FROM championships')) ?? 1;
    return db.insert('championships', {
      ...championship.toMap(),
      'id': maxId,
      'organizer_id': 1,
      'updated_at': DateTime.now().toIso8601String(),
    });
  }
}
