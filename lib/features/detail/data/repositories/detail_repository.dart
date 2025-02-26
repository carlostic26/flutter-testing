import 'package:ruta_flutter/features/detail/data/models/detail_model.dart';
import 'package:ruta_flutter/features/detail/domain/repositories/detail_repository.dart';
import 'package:ruta_flutter/features/level/data/datasources/level_local_database.dart';
import 'package:sqflite/sqflite.dart';

class DetailRepositoryImpl implements DetailRepository {
  final LevelLocalDatabaseHelper _dbHelper = LevelLocalDatabaseHelper();

  Future<Database> get _database async => await _dbHelper.getDatabase();

  @override
  Future<DetailModel> getDetail(String subtopicID, String module) async {
    final db = await _database;
    final maps = await db.query(
      'detail',
      where: 'subtopic_id = ? and module = ?',
      whereArgs: [subtopicID, module],
    );

    return DetailModel(
      id: maps[0]['id'] as int,
      definition: maps[0]['definition'] as String,
      codeExample: maps[0]['code_example'] as String,
      imgUrl: maps[0]['img_url'] as String,
    );
  }
}
