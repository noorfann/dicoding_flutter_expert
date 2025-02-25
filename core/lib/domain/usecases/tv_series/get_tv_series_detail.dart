import 'package:dartz/dartz.dart';
import 'package:core/domain/entities/tv_series/tv_series_detail.dart';
import 'package:core/core.dart';
import 'package:core/domain/repositories/tv_series_repository.dart';

class GetTVSeriesDetail {
  final TVSeriesRepository repository;

  GetTVSeriesDetail(this.repository);

  Future<Either<Failure, TVSeriesDetail>> execute(int id) {
    return repository.getTVSeriesDetail(id);
  }
}
