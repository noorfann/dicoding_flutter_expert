import 'package:dartz/dartz.dart';
import 'package:core/domain/usecases/watchlist/save_watchlist_tv_series.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late SaveWatchlistTvSeries usecase;
  late MockWatchlistRepository mockWatchlistRepository;

  setUp(() {
    mockWatchlistRepository = MockWatchlistRepository();
    usecase = SaveWatchlistTvSeries(mockWatchlistRepository);
  });

  test('should save tv series to the repository', () async {
    // arrange
    when(mockWatchlistRepository.saveWatchlistTVSeries(testTVSeriesDetail))
        .thenAnswer((_) async => Right('Added to Watchlist'));
    // act
    final result = await usecase.execute(testTVSeriesDetail);
    // assert
    verify(mockWatchlistRepository.saveWatchlistTVSeries(testTVSeriesDetail));
    expect(result, Right('Added to Watchlist'));
  });
}
