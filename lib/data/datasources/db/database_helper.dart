import 'dart:async';
import 'package:sqflite/sqflite.dart';

enum WatchCategory {
  tvSeries('TVSERIES'),
  movie('MOVIE');

  final String code;

  const WatchCategory(this.code);
}

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  DatabaseHelper._instance() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._instance();

  static Database? _database;

  Future<Database?> get database async {
    if (_database == null) {
      _database = await _initDb();
    }
    return _database;
  }

  static const String _tblWatchlist = 'watchlist';

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/ditonton.db';

    var db = await openDatabase(databasePath, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE  $_tblWatchlist (
        id INTEGER PRIMARY KEY,
        title TEXT,
        overview TEXT,
        posterPath TEXT,
        category TEXT CHECK(category IN ('${WatchCategory.movie.code}','${WatchCategory.tvSeries.code}')) NOT NULL DEFAULT '${WatchCategory.movie.code}'
      );
    ''');
  }

  Future<int> insertWatchlist(Map<String, dynamic> watchlist) async {
    final db = await database;
    return await db!.insert(_tblWatchlist, watchlist);
  }

  Future<int> removeWatchlist(
      {required int id, required WatchCategory category}) async {
    final db = await database;
    return await db!.delete(
      _tblWatchlist,
      where: 'id = ? AND category = ?',
      whereArgs: [id, category.code],
    );
  }

  Future<Map<String, dynamic>?> getWatchlistById(
      {required int id, required WatchCategory category}) async {
    final db = await database;
    final results = await db!.query(
      _tblWatchlist,
      where: 'id = ? AND category = ?',
      whereArgs: [id, category.code],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> getWatchlist(
      WatchCategory category) async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db!.query(_tblWatchlist,
        where: 'category = ?', whereArgs: [category.code]);

    return results;
  }
}
