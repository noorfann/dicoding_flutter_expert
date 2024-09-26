import 'package:ditonton/data/datasources/db/database_helper.dart';
import 'package:ditonton/domain/repositories/watchlist_repository.dart';

class GetWatchListStatus {
  final WatchlistRepository repository;

  GetWatchListStatus(this.repository);

  Future<bool> execute(int id, WatchCategory category) async {
    return repository.isAddedToWatchlist(id, category);
  }
}
