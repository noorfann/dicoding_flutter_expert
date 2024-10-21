import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/tv_series/tv_series.dart';
import 'package:core/domain/usecases/tv_series/get_popular_tv_series.dart';
import 'package:equatable/equatable.dart';

part 'popular_tv_series_event.dart';
part 'popular_tv_series_state.dart';

class PopularTVSeriesBloc
    extends Bloc<PopularTVSeriesEvent, PopularTVSeriesState> {
  final GetPopularTVSeries _getPopularTVSeries;
  PopularTVSeriesBloc(this._getPopularTVSeries)
      : super(GetPopularTVSeriesEmpty()) {
    on<OnGetPopularTVSeries>((event, emit) async {
      emit(GetPopularTVSeriesLoading());
      final result = await _getPopularTVSeries.execute();
      result.fold(
        (failure) {
          emit(GetPopularTVSeriesError(failure.message));
        },
        (data) {
          emit(GetPopularTVSeriesHasData(data));
        },
      );
    });
  }
}
