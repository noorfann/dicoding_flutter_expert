import 'package:ditonton/common/exception.dart';
import 'package:ditonton/data/datasources/db/database_helper.dart';
import 'package:ditonton/data/datasources/tv_series/tv_series_local_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late TVSeriesLocalDataSourceImpl dataSource;
  late MockDatabaseHelper mockDatabaseHelper;

  setUp(() {
    mockDatabaseHelper = MockDatabaseHelper();
    dataSource =
        TVSeriesLocalDataSourceImpl(databaseHelper: mockDatabaseHelper);
  });

  group('save watchlist', () {
    test('should return success message when insert to database is success',
        () async {
      // arrange
      when(mockDatabaseHelper.insertWatchlist(testTVSeriesTable.toJson()))
          .thenAnswer((_) async => 1);
      // act
      final result = await dataSource.insertWatchlist(testTVSeriesTable);
      // assert
      expect(result, 'Added to Watchlist');
    });

    test('should throw DatabaseException when insert to database is failed',
        () async {
      // arrange
      when(mockDatabaseHelper.insertWatchlist(testTVSeriesTable.toJson()))
          .thenThrow(Exception());
      // act
      final call = dataSource.insertWatchlist(testTVSeriesTable);
      // assert
      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });

  group('remove watchlist', () {
    test('should return success message when remove from database is success',
        () async {
      // arrange
      when(mockDatabaseHelper.removeWatchlist(
              id: testTVSeriesTable.id, category: WatchCategory.tvSeries))
          .thenAnswer((_) async => 1);
      // act
      final result = await dataSource.removeWatchlist(testTVSeriesTable);
      // assert
      expect(result, 'Removed from Watchlist');
    });

    test('should throw DatabaseException when remove from database is failed',
        () async {
      // arrange
      when(mockDatabaseHelper.removeWatchlist(
              id: testTVSeriesTable.id, category: WatchCategory.tvSeries))
          .thenThrow(Exception());
      // act
      final call = dataSource.removeWatchlist(testTVSeriesTable);
      // assert
      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });

  group('Get TVSeries Detail By Id', () {
    final tId = 1;

    test('should return TVSeries Detail Table when data is found', () async {
      // arrange
      when(mockDatabaseHelper.getWatchlistById(
              id: tId, category: WatchCategory.tvSeries))
          .thenAnswer((_) async => testTVSeriesMap);
      // act
      final result = await dataSource.getTVSeriesById(tId);
      // assert
      expect(result, testTVSeriesTable);
    });

    test('should return null when data is not found', () async {
      // arrange
      when(mockDatabaseHelper.getWatchlistById(
              id: tId, category: WatchCategory.tvSeries))
          .thenAnswer((_) async => null);
      // act
      final result = await dataSource.getTVSeriesById(tId);
      // assert
      expect(result, null);
    });
  });

  group('get watchlist tv series', () {
    test('should return list of TVSeriesTable from database', () async {
      // arrange
      when(mockDatabaseHelper.getWatchlist(WatchCategory.tvSeries))
          .thenAnswer((_) async => [testTVSeriesMap, testTVSeriesMap]);
      // act
      final result = await dataSource.getWatchlistTVSeries();
      // assert
      expect(result, [testTVSeriesTable, testTVSeriesTable]);
    });
  });
}
