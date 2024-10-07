import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/watch_category_enum.dart';
import 'package:ditonton/domain/entities/movie/movie.dart';
import 'package:ditonton/domain/entities/movie/movie_detail.dart';
import 'package:ditonton/domain/entities/tv_series/tv_series.dart';
import 'package:ditonton/domain/entities/tv_series/tv_series_detail.dart';

abstract class WatchlistRepository {
  Future<Either<Failure, String>> saveWatchlistMovie(MovieDetail movie);
  Future<Either<Failure, String>> saveWatchlistTVSeries(
      TVSeriesDetail tvSeries);
  Future<Either<Failure, String>> removeWatchlist(
      int id, WatchCategory category);
  Future<bool> isAddedToWatchlist(int id, WatchCategory category);
  Future<Either<Failure, List<Movie>>> getWatchlistMovies();
  Future<Either<Failure, List<TVSeries>>> getWatchlistTVSeries();
}
