import 'package:dartz/dartz.dart';
import 'package:ditonton/common/watch_category_enum.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv_series/tv_series.dart';
import 'package:ditonton/domain/usecases/tv_series/get_tv_series_detail.dart';
import 'package:ditonton/domain/usecases/tv_series/get_tv_series_recommendations.dart';
import 'package:ditonton/domain/usecases/watchlist/get_watchlist_status.dart';
import 'package:ditonton/domain/usecases/watchlist/remove_watchlist.dart';
import 'package:ditonton/domain/usecases/watchlist/save_watchlist_tv_series.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/presentation/provider/tv_series/tv_series_detail_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'tv_series_detail_notifier_test.mocks.dart';

@GenerateMocks([
  GetTVSeriesDetail,
  GetTVSeriesRecommendation,
  GetWatchListStatus,
  SaveWatchlistTvSeries,
  RemoveWatchlist,
])
void main() {
  late TVSeriesDetailNotifier provider;
  late MockGetTVSeriesDetail mockGetTVSeriesDetail;
  late MockGetTVSeriesRecommendation mockGetTVSeriesRecommendation;
  late MockGetWatchListStatus mockGetWatchlistStatus;
  late MockSaveWatchlistTvSeries mockSaveWatchlistTvSeries;
  late MockRemoveWatchlist mockRemoveWatchlist;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockGetTVSeriesDetail = MockGetTVSeriesDetail();
    mockGetTVSeriesRecommendation = MockGetTVSeriesRecommendation();
    mockGetWatchlistStatus = MockGetWatchListStatus();
    mockSaveWatchlistTvSeries = MockSaveWatchlistTvSeries();
    mockRemoveWatchlist = MockRemoveWatchlist();
    provider = TVSeriesDetailNotifier(
      getTVSeriesDetail: mockGetTVSeriesDetail,
      getTVSeriesRecommendation: mockGetTVSeriesRecommendation,
      getWatchListStatus: mockGetWatchlistStatus,
      saveWatchlistTvSeries: mockSaveWatchlistTvSeries,
      removeWatchlist: mockRemoveWatchlist,
    )..addListener(() {
        listenerCallCount += 1;
      });
  });

  final tId = 1;

  final tTVSeries = TVSeries(
      adult: false,
      backdropPath: 'backdropPath',
      genreIds: [1, 2, 3],
      id: 1,
      originalName: 'originalName',
      overview: 'overview',
      popularity: 1,
      posterPath: 'posterPath',
      firstAirDate: 'firstAirDate',
      name: 'name',
      voteAverage: 1,
      voteCount: 1,
      originCountry: ['id'],
      originalLanguage: 'id');
  final tTVSeriesList = <TVSeries>[tTVSeries];

  void _arrangeUsecase() {
    when(mockGetTVSeriesDetail.execute(tId))
        .thenAnswer((_) async => Right(testTVSeriesDetail));
    when(mockGetTVSeriesRecommendation.execute(tId))
        .thenAnswer((_) async => Right(tTVSeriesList));
  }

  group('Get TVSeries Detail', () {
    test('should get data from the usecase', () async {
      // arrange
      _arrangeUsecase();
      // act
      await provider.fetchTVSeriesDetail(tId);
      // assert
      verify(mockGetTVSeriesDetail.execute(tId));
      verify(mockGetTVSeriesRecommendation.execute(tId));
    });

    test('should change state to Loading when usecase is called', () {
      // arrange
      _arrangeUsecase();
      // act
      provider.fetchTVSeriesDetail(tId);
      // assert
      expect(provider.tvSeriesState, RequestState.Loading);
      expect(listenerCallCount, 1);
    });

    test('should change tv series when data is gotten successfully', () async {
      // arrange
      _arrangeUsecase();
      // act
      await provider.fetchTVSeriesDetail(tId);
      // assert
      expect(provider.tvSeriesState, RequestState.Loaded);
      expect(provider.tvSeries, testTVSeriesDetail);
      expect(listenerCallCount, 3);
    });

    test(
        'should change recommendation tvSeriess when data is gotten successfully',
        () async {
      // arrange
      _arrangeUsecase();
      // act
      await provider.fetchTVSeriesDetail(tId);
      // assert
      expect(provider.tvSeriesState, RequestState.Loaded);
      expect(provider.tvSeriesRecommendations, tTVSeriesList);
    });
  });

  group('Get tvSeries Recommendations', () {
    test('should get data from the usecase', () async {
      // arrange
      _arrangeUsecase();
      // act
      await provider.fetchTVSeriesDetail(tId);
      // assert
      verify(mockGetTVSeriesRecommendation.execute(tId));
      expect(provider.tvSeriesRecommendations, tTVSeriesList);
    });

    test('should update recommendation state when data is gotten successfully',
        () async {
      // arrange
      _arrangeUsecase();
      // act
      await provider.fetchTVSeriesDetail(tId);
      // assert
      expect(provider.recommendationState, RequestState.Loaded);
      expect(provider.tvSeriesRecommendations, tTVSeriesList);
    });

    test('should update error message when request in successful', () async {
      // arrange
      when(mockGetTVSeriesDetail.execute(tId))
          .thenAnswer((_) async => Right(testTVSeriesDetail));
      when(mockGetTVSeriesRecommendation.execute(tId))
          .thenAnswer((_) async => Left(ServerFailure('Failed')));
      // act
      await provider.fetchTVSeriesDetail(tId);
      // assert
      expect(provider.recommendationState, RequestState.Error);
      expect(provider.message, 'Failed');
    });
  });

  group('Watchlist', () {
    test('should get the watchlist status', () async {
      // arrange
      when(mockGetWatchlistStatus.execute(1, WatchCategory.tvSeries))
          .thenAnswer((_) async => true);
      // act
      await provider.loadWatchlistStatus(1);
      // assert
      expect(provider.isAddedToWatchlist, true);
    });

    test('should execute save watchlist when function called', () async {
      // arrange
      when(mockSaveWatchlistTvSeries.execute(testTVSeriesDetail))
          .thenAnswer((_) async => Right('Success'));
      when(mockGetWatchlistStatus.execute(
              testTVSeriesDetail.id, WatchCategory.tvSeries))
          .thenAnswer((_) async => true);
      // act
      await provider.addWatchlist(testTVSeriesDetail);
      // assert
      verify(mockSaveWatchlistTvSeries.execute(testTVSeriesDetail));
    });

    test('should execute remove watchlist when function called', () async {
      // arrange
      when(mockRemoveWatchlist.execute(
              testTVSeriesDetail.id, WatchCategory.tvSeries))
          .thenAnswer((_) async => Right('Removed'));
      when(mockGetWatchlistStatus.execute(
              testTVSeriesDetail.id, WatchCategory.tvSeries))
          .thenAnswer((_) async => false);
      // act
      await provider.removeFromWatchlist(testTVSeriesDetail);
      // assert
      verify(mockRemoveWatchlist.execute(
          testTVSeriesDetail.id, WatchCategory.tvSeries));
    });

    test('should update watchlist status when add watchlist success', () async {
      // arrange
      when(mockSaveWatchlistTvSeries.execute(testTVSeriesDetail))
          .thenAnswer((_) async => Right('Added to Watchlist'));
      when(mockGetWatchlistStatus.execute(
              testTVSeriesDetail.id, WatchCategory.tvSeries))
          .thenAnswer((_) async => true);
      // act
      await provider.addWatchlist(testTVSeriesDetail);
      // assert
      verify(mockGetWatchlistStatus.execute(
          testTVSeriesDetail.id, WatchCategory.tvSeries));
      expect(provider.isAddedToWatchlist, true);
      expect(provider.watchlistMessage, 'Added to Watchlist');
      expect(listenerCallCount, 1);
    });

    test('should update watchlist message when add watchlist failed', () async {
      // arrange
      when(mockSaveWatchlistTvSeries.execute(testTVSeriesDetail))
          .thenAnswer((_) async => Left(DatabaseFailure('Failed')));
      when(mockGetWatchlistStatus.execute(
              testTVSeriesDetail.id, WatchCategory.tvSeries))
          .thenAnswer((_) async => false);
      // act
      await provider.addWatchlist(testTVSeriesDetail);
      // assert
      expect(provider.watchlistMessage, 'Failed');
      expect(listenerCallCount, 1);
    });
  });

  group('on Error', () {
    test('should return error when data is unsuccessful', () async {
      // arrange
      when(mockGetTVSeriesDetail.execute(tId))
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      when(mockGetTVSeriesRecommendation.execute(tId))
          .thenAnswer((_) async => Right(tTVSeriesList));
      // act
      await provider.fetchTVSeriesDetail(tId);
      // assert
      expect(provider.tvSeriesState, RequestState.Error);
      expect(provider.message, 'Server Failure');
      expect(listenerCallCount, 2);
    });
  });
}
