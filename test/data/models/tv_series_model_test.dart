import 'package:ditonton/data/models/tv_series/tv_series_model.dart';
import 'package:ditonton/domain/entities/tv_series/tv_series.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tTVSeriesModel = TVSeriesModel(
    adult: false,
    backdropPath: 'backdropPath',
    genreIds: [1, 2, 3],
    id: 1,
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    voteAverage: 1,
    voteCount: 1,
    name: 'name',
    originalName: 'originalName',
    firstAirDate: 'firstAirDate',
    originCountry: ['originCountry'],
    originalLanguage: 'originalLanguage',
  );

  final tMovie = TVSeries(
    adult: false,
    backdropPath: 'backdropPath',
    genreIds: [1, 2, 3],
    id: 1,
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    voteAverage: 1,
    voteCount: 1,
    name: 'name',
    originalName: 'originalName',
    firstAirDate: 'firstAirDate',
    originCountry: ['originCountry'],
    originalLanguage: 'originalLanguage',
  );

  test('should be a subclass of TVSeries entity', () async {
    final result = tTVSeriesModel.toEntity();
    expect(result, tMovie);
  });
}
