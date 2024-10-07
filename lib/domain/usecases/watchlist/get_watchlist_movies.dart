import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/movie/movie.dart';
import 'package:core/core.dart';
import 'package:ditonton/domain/repositories/watchlist_repository.dart';

class GetWatchlistMovies {
  final WatchlistRepository _repository;

  GetWatchlistMovies(this._repository);

  Future<Either<Failure, List<Movie>>> execute() {
    return _repository.getWatchlistMovies();
  }
}
