import 'package:ditonton/common/exception.dart';
import 'package:ditonton/data/datasources/db/database_helper.dart';
import 'package:ditonton/data/models/watchlist_table.dart';

abstract class WatchlistLocalDataSource {
  Future<String> insertWatchlist(WatchlistTable watchlist);
  Future<String> removeWatchlist(int id, WatchCategory category);
  Future<WatchlistTable?> getWatchlistById(int id, WatchCategory category);
  Future<List<WatchlistTable>> getWatchlist(WatchCategory category);
}

class WatchlistLocalDataSourceImpl implements WatchlistLocalDataSource {
  final DatabaseHelper databaseHelper;

  WatchlistLocalDataSourceImpl({required this.databaseHelper});

  @override
  Future<String> insertWatchlist(WatchlistTable watchlist) async {
    try {
      await databaseHelper.insertWatchlist(watchlist.toJson());
      return 'Added to Watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> removeWatchlist(int id, WatchCategory category) async {
    try {
      await databaseHelper.removeWatchlist(id: id, category: category);
      return 'Removed from Watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<WatchlistTable?> getWatchlistById(
      int id, WatchCategory category) async {
    final result =
        await databaseHelper.getWatchlistById(id: id, category: category);
    if (result != null) {
      return WatchlistTable.fromMap(result);
    } else {
      return null;
    }
  }

  @override
  Future<List<WatchlistTable>> getWatchlist(WatchCategory category) async {
    final result = await databaseHelper.getWatchlist(category);
    return result.map((data) => WatchlistTable.fromMap(data)).toList();
  }
}
