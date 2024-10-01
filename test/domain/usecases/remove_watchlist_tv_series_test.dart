import 'package:dartz/dartz.dart';
import 'package:ditonton/common/watch_category_enum.dart';
import 'package:ditonton/domain/usecases/watchlist/remove_watchlist.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late RemoveWatchlist usecase;
  late MockWatchlistRepository mockWatchlistRepository;

  setUp(() {
    mockWatchlistRepository = MockWatchlistRepository();
    usecase = RemoveWatchlist(mockWatchlistRepository);
  });

  test('should remove watchlist movie from repository', () async {
    // arrange
    when(mockWatchlistRepository.removeWatchlist(1, WatchCategory.movie))
        .thenAnswer((_) async => Right('Removed from watchlist'));
    // act
    final result = await usecase.execute(1, WatchCategory.movie);
    // assert
    verify(mockWatchlistRepository.removeWatchlist(1, WatchCategory.movie));
    expect(result, Right('Removed from watchlist'));
  });

  test('should remove watchlist tv series from repository', () async {
    // arrange
    when(mockWatchlistRepository.removeWatchlist(1, WatchCategory.tvSeries))
        .thenAnswer((_) async => Right('Removed from watchlist'));
    // act
    final result = await usecase.execute(1, WatchCategory.tvSeries);
    // assert
    verify(mockWatchlistRepository.removeWatchlist(1, WatchCategory.tvSeries));
    expect(result, Right('Removed from watchlist'));
  });
}
