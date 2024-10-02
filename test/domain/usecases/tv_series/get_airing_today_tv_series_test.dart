import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tv_series/tv_series.dart';
import 'package:ditonton/domain/usecases/tv_series/get_now_playing_tv_series.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late GetAiringTodayTVSeries usecase;
  late MockTVSeriesRepository mockTVSeriesRepository;

  setUp(() {
    mockTVSeriesRepository = MockTVSeriesRepository();
    usecase = GetAiringTodayTVSeries(mockTVSeriesRepository);
  });

  final tTvSeries = <TVSeries>[];

  test('should get list of tTvSeries from the repository', () async {
    // arrange
    when(mockTVSeriesRepository.getAiringTodayTVSeries())
        .thenAnswer((_) async => Right(tTvSeries));
    // act
    final result = await usecase.execute();
    // assert
    expect(result, Right(tTvSeries));
  });
}
