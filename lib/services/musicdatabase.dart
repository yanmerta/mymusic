import 'dart:async';
import 'package:path/path.dart';
import 'package:music_app_ui/models/music.dart';
import 'package:sqflite/sqflite.dart';

class MusicDatabaseHelper {
  static final MusicDatabaseHelper _instance = MusicDatabaseHelper.internal();
  factory MusicDatabaseHelper() => _instance;
  static late Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  MusicDatabaseHelper.internal();

  get database => null;

  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'music.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE Music (id INTEGER PRIMARY KEY, title TEXT, artist TEXT, genre TEXT, year INTEGER)');
  }

  Future<int> addMusic(Music music) async {
    final dbHelper = await db;
    return await dbHelper.insert('Music', music.toMap());
  }

  Future<List<Music>> getMusics() async {
    final dbHelper = await db;
    final List<Map<String, dynamic>> maps = await dbHelper.query('Music');
    return List.generate(maps.length, (i) {
      return Music.fromMap(maps[i]);
    });
  }

  Future<int> updateMusic(Music music) async {
    final dbHelper = await db;
    return await dbHelper.update('Music', music.toMap(),
        where: 'id = ?', whereArgs: [music.id]);
  }

  Future<int> deleteMusic(int id) async {
    final dbHelper = await db;
    return await dbHelper.delete('Music', where: 'id = ?', whereArgs: [id]);
  }

Future<int> insertProduct(Music music) async {
  final dbHelper = await db;
  return await dbHelper.insert('Music', music.toMap());
}


  openDb() {}

  closeDb() {}
}
