part of 'popular_tv_series_bloc.dart';

sealed class PopularTVSeriesState extends Equatable {
  const PopularTVSeriesState();

  @override
  List<Object> get props => [];
}

/// get popular movies state
final class GetPopularTVSeriesEmpty extends PopularTVSeriesState {}

final class GetPopularTVSeriesLoading extends PopularTVSeriesState {}

class GetPopularTVSeriesError extends PopularTVSeriesState {
  final String message;

  GetPopularTVSeriesError(this.message);

  @override
  List<Object> get props => [message];
}

class GetPopularTVSeriesHasData extends PopularTVSeriesState {
  final List<TVSeries> result;

  GetPopularTVSeriesHasData(this.result);

  @override
  List<Object> get props => [result];
}
