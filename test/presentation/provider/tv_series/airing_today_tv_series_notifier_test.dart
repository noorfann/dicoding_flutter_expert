import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv_series/tv_series.dart';
import 'package:ditonton/domain/usecases/tv_series/get_now_playing_tv_series.dart';
import 'package:ditonton/presentation/provider/tv_series/airing_today_tv_series_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'airing_today_tv_series_notifier_test.mocks.dart';

@GenerateMocks([GetAiringTodayTVSeries])
void main() {
  late MockGetAiringTodayTVSeries mockGetAiringTodayTVSeries;
  late AiringTodayTVSeriesNotifier notifier;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockGetAiringTodayTVSeries = MockGetAiringTodayTVSeries();
    notifier = AiringTodayTVSeriesNotifier(mockGetAiringTodayTVSeries)
      ..addListener(() {
        listenerCallCount++;
      });
  });

  final tTVSeries = TVSeries(
      adult: false,
      backdropPath: 'backdropPath',
      genreIds: [1, 2, 3],
      id: 1,
      originalLanguage: 'originalLanguange',
      overview: 'overview',
      popularity: 1,
      posterPath: 'posterPath',
      firstAirDate: 'firstAirDate',
      name: 'name',
      voteAverage: 1,
      voteCount: 1,
      originCountry: ['id'],
      originalName: 'id');

  final tTVSeriesList = <TVSeries>[tTVSeries];

  test('should change state to loading when usecase is called', () async {
    // arrange
    when(mockGetAiringTodayTVSeries.execute())
        .thenAnswer((_) async => Right(tTVSeriesList));
    // act
    notifier.fetchAiringTodayTVSeries();
    // assert
    expect(notifier.state, RequestState.Loading);
    expect(listenerCallCount, 1);
  });

  test('should change movies data when data is gotten successfully', () async {
    // arrange
    when(mockGetAiringTodayTVSeries.execute())
        .thenAnswer((_) async => Right(tTVSeriesList));
    // act
    await notifier.fetchAiringTodayTVSeries();
    // assert
    expect(notifier.state, RequestState.Loaded);
    expect(notifier.tvSeries, tTVSeriesList);
    expect(listenerCallCount, 2);
  });

  test('should return error when data is unsuccessful', () async {
    // arrange
    when(mockGetAiringTodayTVSeries.execute())
        .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
    // act
    await notifier.fetchAiringTodayTVSeries();
    // assert
    expect(notifier.state, RequestState.Error);
    expect(notifier.message, 'Server Failure');
    expect(listenerCallCount, 2);
  });
}
