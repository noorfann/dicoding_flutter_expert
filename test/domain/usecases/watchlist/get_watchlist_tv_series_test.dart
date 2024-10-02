import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/usecases/watchlist/get_watchlist_tv_series.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late GetWatchlistTvSeries usecase;
  late MockWatchlistRepository mockWatchlistRepository;

  setUp(() {
    mockWatchlistRepository = MockWatchlistRepository();
    usecase = GetWatchlistTvSeries(mockWatchlistRepository);
  });

  test('should get list of movies from the repository', () async {
    // arrange
    when(mockWatchlistRepository.getWatchlistTVSeries())
        .thenAnswer((_) async => Right(testTVSeriesList));
    // act
    final result = await usecase.execute();
    // assert
    expect(result, Right(testTVSeriesList));
  });
}
