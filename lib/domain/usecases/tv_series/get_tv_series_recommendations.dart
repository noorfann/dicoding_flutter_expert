import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tv_series/tv_series.dart';
import 'package:core/core.dart';
import 'package:ditonton/domain/repositories/tv_series_repository.dart';

class GetTVSeriesRecommendation {
  final TVSeriesRepository repository;

  GetTVSeriesRecommendation(this.repository);

  Future<Either<Failure, List<TVSeries>>> execute(id) {
    return repository.getTVSeriesRecommendations(id);
  }
}
