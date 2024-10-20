import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/tv_series/tv_series.dart';
import 'package:ditonton/domain/usecases/tv_series/get_tv_series_recommendations.dart';
import 'package:equatable/equatable.dart';

part 'tv_series_recommendation_event.dart';
part 'tv_series_recommendation_state.dart';

class TvSeriesRecommendationBloc
    extends Bloc<TvSeriesRecommendationEvent, TvSeriesRecommendationState> {
  GetTVSeriesRecommendation _getTVSeriesRecommendation;
  TvSeriesRecommendationBloc(this._getTVSeriesRecommendation)
      : super(TvSeriesRecommendationEmpty()) {
    on<OnGetTvSeriesRecommendation>((event, emit) async {
      emit(TvSeriesRecommendationLoading());
      final result = await _getTVSeriesRecommendation.execute(event.id);
      result.fold(
        (error) {
          emit(TvSeriesRecommendationError(error.message));
        },
        (data) {
          emit(TvSeriesRecommendationHasData(data));
        },
      );
    });
  }
}
