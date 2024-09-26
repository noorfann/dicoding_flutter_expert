import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/data/datasources/db/database_helper.dart';
import 'package:ditonton/domain/repositories/watchlist_repository.dart';

class RemoveWatchlist {
  final WatchlistRepository repository;

  RemoveWatchlist(this.repository);

  Future<Either<Failure, String>> execute(int id, WatchCategory category) {
    return repository.removeWatchlist(id, category);
  }
}
