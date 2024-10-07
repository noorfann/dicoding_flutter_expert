import 'package:dartz/dartz.dart';
import 'package:core/core.dart';
import 'package:ditonton/common/watch_category_enum.dart';
import 'package:ditonton/domain/repositories/watchlist_repository.dart';

class RemoveWatchlist {
  final WatchlistRepository repository;

  RemoveWatchlist(this.repository);

  Future<Either<Failure, String>> execute(int id, WatchCategory category) {
    return repository.removeWatchlist(id, category);
  }
}
