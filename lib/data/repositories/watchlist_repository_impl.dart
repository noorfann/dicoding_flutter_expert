import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/watch_category_enum.dart';
import 'package:ditonton/data/datasources/watchlist_local_data_source.dart';
import 'package:ditonton/data/models/watchlist_table.dart';
import 'package:ditonton/domain/entities/movie/movie.dart';
import 'package:ditonton/domain/entities/movie/movie_detail.dart';
import 'package:ditonton/domain/entities/tv_series/tv_series.dart';
import 'package:ditonton/domain/entities/tv_series/tv_series_detail.dart';
import 'package:ditonton/domain/repositories/watchlist_repository.dart';

class WatchlistRepositoryImpl implements WatchlistRepository {
  final WatchlistLocalDataSource localDataSource;

  WatchlistRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, String>> saveWatchlistMovie(MovieDetail movie) async {
    try {
      final result = await localDataSource.insertWatchlist(
          WatchlistTable.fromMovieEntity(movie), WatchCategory.movie);
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<Either<Failure, String>> saveWatchlistTVSeries(
      TVSeriesDetail tvSeries) async {
    try {
      final result = await localDataSource.insertWatchlist(
          WatchlistTable.fromTVSeriesEntity(tvSeries), WatchCategory.tvSeries);
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<Either<Failure, String>> removeWatchlist(
      int id, WatchCategory category) async {
    try {
      final result = await localDataSource.removeWatchlist(id, category);
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<bool> isAddedToWatchlist(int id, WatchCategory category) async {
    final result = await localDataSource.getWatchlistById(id, category);
    return result != null;
  }

  @override
  Future<Either<Failure, List<TVSeries>>> getWatchlistTVSeries() async {
    final result = await localDataSource.getWatchlist(WatchCategory.tvSeries);
    return Right(result.map((data) => data.toEntityTVSeries()).toList());
  }

  @override
  Future<Either<Failure, List<Movie>>> getWatchlistMovies() async {
    final result = await localDataSource.getWatchlist(WatchCategory.movie);
    return Right(result.map((data) => data.toEntityMovie()).toList());
  }
}
