import 'package:dartz/dartz.dart';
import 'package:ditonton/common/exception.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/data/datasources/db/database_helper.dart';
import 'package:ditonton/data/repositories/watchlist_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late WatchlistRepositoryImpl repository;
  late MockWatchlistLocalDataSource mockLocalDataSource;

  setUp(() {
    mockLocalDataSource = MockWatchlistLocalDataSource();
    repository = WatchlistRepositoryImpl(
      localDataSource: mockLocalDataSource,
    );
  });

  group('save watchlist', () {
    test('should return success message when saving watchlistMovie successful',
        () async {
      // arrange
      when(mockLocalDataSource.insertWatchlist(testWatchlistTable))
          .thenAnswer((_) async => 'Added to Watchlist');
      // act
      final result = await repository.saveWatchlistMovie(testMovieDetail);
      // assert
      expect(result, Right('Added to Watchlist'));
    });

    test(
        'should return success message when saving watchlistTvSeries successful',
        () async {
      // arrange
      when(mockLocalDataSource.insertWatchlist(testWatchlistTable))
          .thenAnswer((_) async => 'Added to Watchlist');
      // act
      final result = await repository.saveWatchlistTVSeries(testTVSeriesDetail);
      // assert
      expect(result, Right('Added to Watchlist'));
    });

    test(
        'should return DatabaseFailure when saving watchlistMovie unsuccessful',
        () async {
      // arrange
      when(mockLocalDataSource.insertWatchlist(testWatchlistTable))
          .thenThrow(DatabaseException('Failed to add watchlist'));
      // act
      final result = await repository.saveWatchlistMovie(testMovieDetail);
      // assert
      expect(result, Left(DatabaseFailure('Failed to add watchlist')));
    });

    test(
        'should return DatabaseFailure when saving watchlistTVseries unsuccessful',
        () async {
      // arrange
      when(mockLocalDataSource.insertWatchlist(testWatchlistTable))
          .thenThrow(DatabaseException('Failed to add watchlist'));
      // act
      final result = await repository.saveWatchlistTVSeries(testTVSeriesDetail);
      // assert
      expect(result, Left(DatabaseFailure('Failed to add watchlist')));
    });
  });

  group('remove watchlist', () {
    test('should return success message when remove Movie successful',
        () async {
      // arrange
      when(mockLocalDataSource.removeWatchlist(
              testWatchlistTable.id, WatchCategory.movie))
          .thenAnswer((_) async => 'Removed from watchlist');
      // act
      final result = await repository.removeWatchlist(
          testWatchlistTable.id, WatchCategory.movie);
      // assert
      expect(result, Right('Removed from watchlist'));
    });

    test('should return success message when remove TVSeries successful',
        () async {
      // arrange
      when(mockLocalDataSource.removeWatchlist(
              testWatchlistTable.id, WatchCategory.tvSeries))
          .thenAnswer((_) async => 'Removed from watchlist');
      // act
      final result = await repository.removeWatchlist(
          testWatchlistTable.id, WatchCategory.tvSeries);
      // assert
      expect(result, Right('Removed from watchlist'));
    });

    test('should return DatabaseFailure when remove Movie unsuccessful',
        () async {
      // arrange
      when(mockLocalDataSource.removeWatchlist(
              testWatchlistTable.id, WatchCategory.movie))
          .thenThrow(DatabaseException('Failed to remove watchlist'));
      // act
      final result = await repository.removeWatchlist(
          testWatchlistTable.id, WatchCategory.movie);
      // assert
      expect(result, Left(DatabaseFailure('Failed to remove watchlist')));
    });

    test('should return DatabaseFailure when remove TVSeries unsuccessful',
        () async {
      // arrange
      when(mockLocalDataSource.removeWatchlist(
              testWatchlistTable.id, WatchCategory.tvSeries))
          .thenThrow(DatabaseException('Failed to remove watchlist'));
      // act
      final result = await repository.removeWatchlist(
          testWatchlistTable.id, WatchCategory.tvSeries);
      // assert
      expect(result, Left(DatabaseFailure('Failed to remove watchlist')));
    });
  });

  group('get watchlist status', () {
    test('should return watch status whether Watchlist Movie data is found',
        () async {
      // arrange
      final tId = 1;
      when(mockLocalDataSource.getWatchlistById(tId, WatchCategory.movie))
          .thenAnswer((_) async => null);
      // act
      final result =
          await repository.isAddedToWatchlist(tId, WatchCategory.movie);
      // assert
      expect(result, false);
    });

    test('should return watch status whether Watchlist TVSeries data is found',
        () async {
      // arrange
      final tId = 1;
      when(mockLocalDataSource.getWatchlistById(tId, WatchCategory.tvSeries))
          .thenAnswer((_) async => null);
      // act
      final result =
          await repository.isAddedToWatchlist(tId, WatchCategory.tvSeries);
      // assert
      expect(result, false);
    });
  });

  group('get watchlist', () {
    test('should return list of Movies', () async {
      // arrange
      when(mockLocalDataSource.getWatchlist(WatchCategory.movie))
          .thenAnswer((_) async => [testWatchlistTable]);
      // act
      final result = await repository.getWatchlistMovies();
      // assert
      final resultList = result.getOrElse(() => []);
      expect(resultList, [testWatchlistMovie]);
    });

    test('should return list of TVSeries', () async {
      // arrange
      when(mockLocalDataSource.getWatchlist(WatchCategory.tvSeries))
          .thenAnswer((_) async => [testWatchlistTable]);
      // act
      final result = await repository.getWatchlistTVSeries();
      // assert
      final resultList = result.getOrElse(() => []);
      expect(resultList, [testWatchlistTVSeries]);
    });
  });
}
