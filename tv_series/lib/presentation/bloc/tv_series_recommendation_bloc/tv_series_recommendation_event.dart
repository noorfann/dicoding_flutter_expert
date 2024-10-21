part of 'tv_series_recommendation_bloc.dart';

sealed class TvSeriesRecommendationEvent extends Equatable {
  const TvSeriesRecommendationEvent();

  @override
  List<Object> get props => [];
}

class OnGetTvSeriesRecommendation extends TvSeriesRecommendationEvent {
  final int id;

  const OnGetTvSeriesRecommendation(this.id);

  @override
  List<Object> get props => [id];
}
