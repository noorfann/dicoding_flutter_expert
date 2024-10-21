import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:core/domain/entities/tv_series/tv_series.dart';
import 'package:core/domain/repositories/tv_series_repository.dart';

class GetAiringTodayTVSeries {
  final TVSeriesRepository repository;

  GetAiringTodayTVSeries(this.repository);

  Future<Either<Failure, List<TVSeries>>> execute() {
    return repository.getAiringTodayTVSeries();
  }
}
