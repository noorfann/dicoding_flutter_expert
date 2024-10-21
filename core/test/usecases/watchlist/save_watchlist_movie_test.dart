import 'package:dartz/dartz.dart';
import 'package:core/domain/usecases/watchlist/save_watchlist_movie.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late SaveWatchlistMovie usecase;
  late MockWatchlistRepository mockWatchlistRepository;

  setUp(() {
    mockWatchlistRepository = MockWatchlistRepository();
    usecase = SaveWatchlistMovie(mockWatchlistRepository);
  });

  test('should save movie to the repository', () async {
    // arrange
    when(mockWatchlistRepository.saveWatchlistMovie(testMovieDetail))
        .thenAnswer((_) async => Right('Added to Watchlist'));
    // act
    final result = await usecase.execute(testMovieDetail);
    // assert
    verify(mockWatchlistRepository.saveWatchlistMovie(testMovieDetail));
    expect(result, Right('Added to Watchlist'));
  });
}
