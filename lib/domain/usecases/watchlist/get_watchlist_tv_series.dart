import 'package:dartz/dartz.dart';
import 'package:core/core.dart';
import 'package:ditonton/domain/entities/tv_series/tv_series.dart';
import 'package:ditonton/domain/repositories/watchlist_repository.dart';

class GetWatchlistTvSeries {
  final WatchlistRepository _repository;

  GetWatchlistTvSeries(this._repository);

  Future<Either<Failure, List<TVSeries>>> execute() {
    return _repository.getWatchlistTVSeries();
  }
}
