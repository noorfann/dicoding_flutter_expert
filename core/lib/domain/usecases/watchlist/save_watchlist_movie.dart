import 'package:dartz/dartz.dart';
import 'package:core/core.dart';
import 'package:core/domain/entities/movie/movie_detail.dart';
import 'package:core/domain/repositories/watchlist_repository.dart';

class SaveWatchlistMovie {
  final WatchlistRepository repository;

  SaveWatchlistMovie(this.repository);

  Future<Either<Failure, String>> execute(MovieDetail movie) {
    return repository.saveWatchlistMovie(movie);
  }
}
