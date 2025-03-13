import 'package:path/path.dart';
import 'package:ruta_flutter/features/detail/data/datasourcers/detail_local_database.dart';
import 'package:ruta_flutter/features/topic/data/datasources/subtopic_local_database.dart';
import 'package:sqflite/sqflite.dart';
import 'package:ruta_flutter/features/level/data/datasources/level_local_database.dart';
import 'package:ruta_flutter/features/topic/data/datasources/topic_local_database.dart';
import 'package:ruta_flutter/features/score/data/datasources/score_local_database.dart';

class LocalDatabaseHelper {
  Database? _database;
  int dbVersion = 5;

  Future<Database> getDatabase() async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    try {
      final dbPath = await getDatabasesPath();
      final String dbName = 'ruta_flutter_db_$dbVersion.db';

      return await openDatabase(
        join(dbPath, dbName),
        version: 1,
        onCreate: (db, version) async {
          // Delegar la creación de tablas a cada feature
          await LevelLocalDatabaseHelper().createLevelTable(db);
          await TopicLocalDatabaseHelper().createTopicTable(db);
          await SubtopicLocalDatabaseHelper().createSubtopicTable(db);
          await DetailLocalDatabaseHelper().createDetailTable(db);
          await ScoreLocalDatabaseHelper().createScoreTable(db);
        },
      );
    } catch (e) {
      throw Exception('Error initializing global database: $e');
    }
  }
}
