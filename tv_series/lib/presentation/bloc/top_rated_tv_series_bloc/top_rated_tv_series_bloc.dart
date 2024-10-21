import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/tv_series/tv_series.dart';
import 'package:core/domain/usecases/tv_series/get_top_rated_tv_series.dart';
import 'package:equatable/equatable.dart';

part 'top_rated_tv_series_event.dart';
part 'top_rated_tv_series_state.dart';

class TopRatedTVSeriesBloc
    extends Bloc<TopRatedTVSeriesEvent, TopRatedTVSeriesState> {
  final GetTopRatedTVSeries _getTopRatedTVSeries;
  TopRatedTVSeriesBloc(this._getTopRatedTVSeries)
      : super(GetTopRatedTVSeriesEmpty()) {
    on<OnGetTopRatedTVSeries>((event, emit) async {
      emit(GetTopRatedTVSeriesLoading());
      final result = await _getTopRatedTVSeries.execute();

      result.fold(
        (failure) {
          emit(GetTopRatedTVSeriesError(failure.message));
        },
        (data) {
          emit(GetTopRatedTVSeriesHasData(data));
        },
      );
    });
  }
}
