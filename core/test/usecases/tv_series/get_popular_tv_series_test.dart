import 'package:dartz/dartz.dart';
import 'package:core/domain/entities/tv_series/tv_series.dart';
import 'package:core/domain/usecases/tv_series/get_popular_tv_series.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetPopularTVSeries usecase;
  late MockTVSeriesRepository mockTVSeriesRepository;

  setUp(() {
    mockTVSeriesRepository = MockTVSeriesRepository();
    usecase = GetPopularTVSeries(mockTVSeriesRepository);
  });

  final tTvSeries = <TVSeries>[];

  group('GetPopularTVSeries Tests', () {
    group('execute', () {
      test(
          'should get list of tTvSeries from the repository when execute function is called',
          () async {
        // arrange
        when(mockTVSeriesRepository.getPopularTVSeries())
            .thenAnswer((_) async => Right(tTvSeries));
        // act
        final result = await usecase.execute();
        // assert
        expect(result, Right(tTvSeries));
      });
    });
  });
}
