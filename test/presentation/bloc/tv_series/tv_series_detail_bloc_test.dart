import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/genre.dart';
import 'package:ditonton/domain/entities/tv_series/tv_series_detail.dart';
import 'package:ditonton/presentation/bloc/movie/movie_detail/movie_detail_bloc.dart';
import 'package:ditonton/presentation/bloc/tv_series/tv_series_detail/tv_series_detail_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../provider/tv_series/tv_series_detail_notifier_test.mocks.dart';

void main() {
  late TVSeriesDetailBloc tvSeriesDetailBloc;
  late MockGetTVSeriesDetail mockGetTVSeriesDetail;

  setUp(() {
    mockGetTVSeriesDetail = MockGetTVSeriesDetail();
    tvSeriesDetailBloc = TVSeriesDetailBloc(mockGetTVSeriesDetail);
  });

  test('initial state should be empty', () {
    expect(tvSeriesDetailBloc.state, MovieDetailEmpty());
  });

  final tId = 1;

  final tTVSeriesDetail = TVSeriesDetail(
    adult: false,
    backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
    genres: [Genre(id: 1, name: 'name')],
    name: 'name',
    originalName: 'originalName',
    episodeRunTime: [],
    seasons: [],
    id: 557,
    overview:
        'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
    posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
    voteAverage: 7.2,
    voteCount: 13507,
  );

  blocTest<TVSeriesDetailBloc, TVSeriesDetailState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockGetTVSeriesDetail.execute(tId))
          .thenAnswer((_) async => Right(tTVSeriesDetail));
      return tvSeriesDetailBloc;
    },
    act: (bloc) => bloc.add(OnGetTVSeriesDetail(tId)),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      TVSeriesDetailLoading(),
      TVSeriesDetailHasData(tTVSeriesDetail),
    ],
    verify: (bloc) {
      verify(mockGetTVSeriesDetail.execute(tId));
    },
  );

  blocTest<TVSeriesDetailBloc, TVSeriesDetailState>(
    'Should emit [Loading, Error] when get movie detail is unsuccessful',
    build: () {
      when(mockGetTVSeriesDetail.execute(tId))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return tvSeriesDetailBloc;
    },
    act: (bloc) => bloc.add(OnGetTVSeriesDetail(tId)),
    wait: const Duration(milliseconds: 500),
    expect: () =>
        [TVSeriesDetailLoading(), TVSeriesDetailError('Server Failure')],
    verify: (bloc) {
      verify(mockGetTVSeriesDetail.execute(tId));
    },
  );
}
