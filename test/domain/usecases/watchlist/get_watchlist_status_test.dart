import 'package:ditonton/common/watch_category_enum.dart';
import 'package:ditonton/domain/usecases/watchlist/get_watchlist_status.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late GetWatchListStatus usecase;
  late MockWatchlistRepository mockWathclistRepository;

  setUp(() {
    mockWathclistRepository = MockWatchlistRepository();
    usecase = GetWatchListStatus(mockWathclistRepository);
  });

  test('should get movie watchlist status from repository', () async {
    // arrange
    when(mockWathclistRepository.isAddedToWatchlist(1, WatchCategory.movie))
        .thenAnswer((_) async => true);
    // act
    final result = await usecase.execute(1, WatchCategory.movie);
    // assert
    expect(result, true);
  });

  test('should get tv series watchlist status from repository', () async {
    // arrange
    when(mockWathclistRepository.isAddedToWatchlist(1, WatchCategory.movie))
        .thenAnswer((_) async => true);
    // act
    final result = await usecase.execute(1, WatchCategory.movie);
    // assert
    expect(result, true);
  });
}
