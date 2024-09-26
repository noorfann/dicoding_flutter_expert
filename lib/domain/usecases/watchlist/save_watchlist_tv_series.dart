import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv_series/tv_series_detail.dart';
import 'package:ditonton/domain/repositories/watchlist_repository.dart';

class SaveWatchlistTvSeries {
  final WatchlistRepository repository;

  SaveWatchlistTvSeries(this.repository);

  Future<Either<Failure, String>> execute(TVSeriesDetail tvSeries) {
    return repository.saveWatchlistTVSeries(tvSeries);
  }
}
