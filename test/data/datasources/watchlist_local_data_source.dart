import 'package:ditonton/common/exception.dart';
import 'package:ditonton/data/datasources/db/database_helper.dart';
import 'package:ditonton/data/datasources/watchlist_local_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late WatchlistLocalDataSourceImpl dataSource;
  late MockDatabaseHelper mockDatabaseHelper;

  setUp(() {
    mockDatabaseHelper = MockDatabaseHelper();
    dataSource =
        WatchlistLocalDataSourceImpl(databaseHelper: mockDatabaseHelper);
  });

  group('save watchlist', () {
    test('should return success message when insert to database is success',
        () async {
      // arrange
      when(mockDatabaseHelper.insertWatchlist(testWatchlistTable.toJson()))
          .thenAnswer((_) async => 1);
      // act
      final result = await dataSource.insertWatchlist(testWatchlistTable);
      // assert
      expect(result, 'Added to Watchlist');
    });

    test('should throw DatabaseException when insert to database is failed',
        () async {
      // arrange
      when(mockDatabaseHelper.insertWatchlist(testWatchlistTable.toJson()))
          .thenThrow(Exception());
      // act
      final call = dataSource.insertWatchlist(testWatchlistTable);
      // assert
      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });

  group('remove watchlist', () {
    test('should return success message when remove from database is success',
        () async {
      // arrange
      when(mockDatabaseHelper.removeWatchlist(
              id: testWatchlistTable.id, category: WatchCategory.movie))
          .thenAnswer((_) async => 1);
      // act
      final result = await dataSource.removeWatchlist(
          testWatchlistTable.id, WatchCategory.movie);
      // assert
      expect(result, 'Removed from Watchlist');
    });

    test('should throw DatabaseException when remove from database is failed',
        () async {
      // arrange
      when(mockDatabaseHelper.removeWatchlist(
              id: testWatchlistTable.id, category: WatchCategory.movie))
          .thenThrow(Exception());
      // act
      final call = dataSource.removeWatchlist(
          testWatchlistTable.id, WatchCategory.movie);
      // assert
      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });

  group('Get Movie Detail By Id', () {
    final tId = 1;

    test('should return Movie Detail Table when data is found', () async {
      // arrange
      when(mockDatabaseHelper.getWatchlistById(
              id: tId, category: WatchCategory.movie))
          .thenAnswer((_) async => testMovieMap);
      // act
      final result =
          await dataSource.getWatchlistById(tId, WatchCategory.movie);
      // assert
      expect(result, testWatchlistTable);
    });

    test('should return null when data is not found', () async {
      // arrange
      when(mockDatabaseHelper.getWatchlistById(
              id: tId, category: WatchCategory.movie))
          .thenAnswer((_) async => null);
      // act
      final result =
          await dataSource.getWatchlistById(tId, WatchCategory.movie);
      // assert
      expect(result, null);
    });
  });

  group('get watchlist movies', () {
    test('should return list of WatchlistTable from database', () async {
      // arrange
      when(mockDatabaseHelper.getWatchlist(WatchCategory.movie))
          .thenAnswer((_) async => [testMovieMap, testMovieMap]);
      // act
      final result = await dataSource.getWatchlist(WatchCategory.movie);
      // assert
      expect(result, [testWatchlistTable, testWatchlistTable]);
    });
  });
}
