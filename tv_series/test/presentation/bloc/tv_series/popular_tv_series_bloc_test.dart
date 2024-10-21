import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:core/domain/entities/tv_series/tv_series.dart';
import 'package:tv_series/presentation/bloc/popular_tv_series_bloc/popular_tv_series_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late PopularTVSeriesBloc popularTVSeriesBloc;
  late MockGetPopularTVSeries mockGetPopularTVSeries;

  setUp(() {
    mockGetPopularTVSeries = MockGetPopularTVSeries();
    popularTVSeriesBloc = PopularTVSeriesBloc(mockGetPopularTVSeries);
  });

  test('initial GetTopRated state should be empty', () {
    expect(popularTVSeriesBloc.state, GetPopularTVSeriesEmpty());
  });

  final tTVSeriesModel = TVSeries(
    adult: false,
    backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
    genreIds: [14, 28],
    id: 557,
    originalName: 'Spider-Man',
    originCountry: [],
    originalLanguage: 'en',
    firstAirDate: 'firstAirDate',
    name: 'name',
    overview:
        'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
    popularity: 60.441,
    posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
    voteAverage: 7.2,
    voteCount: 13507,
  );
  final tTVSeriesList = <TVSeries>[tTVSeriesModel];

  blocTest<PopularTVSeriesBloc, PopularTVSeriesState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockGetPopularTVSeries.execute())
          .thenAnswer((_) async => Right(tTVSeriesList));
      return popularTVSeriesBloc;
    },
    act: (bloc) => bloc.add(OnGetPopularTVSeries()),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      GetPopularTVSeriesLoading(),
      GetPopularTVSeriesHasData(tTVSeriesList),
    ],
    verify: (bloc) {
      verify(mockGetPopularTVSeries.execute());
    },
  );

  blocTest<PopularTVSeriesBloc, PopularTVSeriesState>(
    'Should emit [Loading, Error] when get top rated movies is unsuccessful',
    build: () {
      when(mockGetPopularTVSeries.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return popularTVSeriesBloc;
    },
    act: (bloc) => bloc.add(OnGetPopularTVSeries()),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      GetPopularTVSeriesLoading(),
      GetPopularTVSeriesError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetPopularTVSeries.execute());
    },
  );
}
