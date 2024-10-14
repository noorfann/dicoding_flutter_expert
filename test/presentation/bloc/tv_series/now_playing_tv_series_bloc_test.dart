import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tv_series/tv_series.dart';
import 'package:ditonton/presentation/bloc/tv_series/now_playing_tv_series_bloc/now_playing_tv_series_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../provider/tv_series/tv_series_list_notifier_test.mocks.dart';

void main() {
  late NowPlayingTVSeriesBloc nowPlayingTVSeriesBloc;
  late MockGetAiringTodayTVSeries mockGetAiringTodayTVSeries;

  setUp(() {
    mockGetAiringTodayTVSeries = MockGetAiringTodayTVSeries();
    nowPlayingTVSeriesBloc = NowPlayingTVSeriesBloc(mockGetAiringTodayTVSeries);
  });

  test('initial GetNowPlaying state should be empty', () {
    expect(nowPlayingTVSeriesBloc.state, GetNowPlayingTVSeriesEmpty());
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

  blocTest<NowPlayingTVSeriesBloc, NowPlayingTVSeriesState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockGetAiringTodayTVSeries.execute())
          .thenAnswer((_) async => Right(tTVSeriesList));
      return nowPlayingTVSeriesBloc;
    },
    act: (bloc) => bloc.add(OnGetNowPlayingTVSeries()),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      GetNowPlayingTVSeriesLoading(),
      GetNowPlayingTVSeriesHasData(tTVSeriesList),
    ],
    verify: (bloc) {
      verify(mockGetAiringTodayTVSeries.execute());
    },
  );

  blocTest<NowPlayingTVSeriesBloc, NowPlayingTVSeriesState>(
    'Should emit [Loading, Error] when get now playing movies is unsuccessful',
    build: () {
      when(mockGetAiringTodayTVSeries.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return nowPlayingTVSeriesBloc;
    },
    act: (bloc) => bloc.add(OnGetNowPlayingTVSeries()),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      GetNowPlayingTVSeriesLoading(),
      GetNowPlayingTVSeriesError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetAiringTodayTVSeries.execute());
    },
  );
}
