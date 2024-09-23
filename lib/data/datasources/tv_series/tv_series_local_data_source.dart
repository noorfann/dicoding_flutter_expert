// import 'package:ditonton/common/exception.dart';
// import 'package:ditonton/data/datasources/db/database_helper.dart';
// import 'package:ditonton/data/models/tv_series/tv_series_table.dart';

// abstract class TVSeriesLocalDataSource {
//   Future<String> insertWatchlist(TVSeriesTable movie);
//   Future<String> removeWatchlist(TVSeriesTable movie);
//   Future<TVSeriesTable?> getTVSeriesById(int id);
//   Future<List<TVSeriesTable>> getWatchlistTVSeries();
// }

// class TVSeriesLocalDataSourceImpl implements TVSeriesLocalDataSource {
//   final DatabaseHelper databaseHelper;

//   TVSeriesLocalDataSourceImpl({required this.databaseHelper});

//   @override
//   Future<String> insertWatchlist(TVSeriesTable movie) async {
//     try {
//       await databaseHelper.insertWatchlist(movie);
//       return 'Added to Watchlist';
//     } catch (e) {
//       throw DatabaseException(e.toString());
//     }
//   }

//   @override
//   Future<String> removeWatchlist(TVSeriesTable movie) async {
//     try {
//       await databaseHelper.removeWatchlist(movie);
//       return 'Removed from Watchlist';
//     } catch (e) {
//       throw DatabaseException(e.toString());
//     }
//   }

//   @override
//   Future<TVSeriesTable?> getTVSeriesById(int id) async {
//     final result = await databaseHelper.getMovieById(id);
//     if (result != null) {
//       return TVSeriesTable.fromMap(result);
//     } else {
//       return null;
//     }
//   }

//   @override
//   Future<List<TVSeriesTable>> getWatchlistTVSeries() async {
//     final result = await databaseHelper.getWatchlistMovies();
//     return result.map((data) => TVSeriesTable.fromMap(data)).toList();
//   }
// }
