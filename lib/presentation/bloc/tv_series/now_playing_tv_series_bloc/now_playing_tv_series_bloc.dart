import 'package:bloc/bloc.dart';
import 'package:ditonton/domain/entities/tv_series/tv_series.dart';
import 'package:ditonton/domain/usecases/tv_series/get_now_playing_tv_series.dart';
import 'package:equatable/equatable.dart';

part 'now_playing_tv_series_event.dart';
part 'now_playing_tv_series_state.dart';

class NowPlayingTVSeriesBloc
    extends Bloc<NowPlayingTVSeriesEvent, NowPlayingTVSeriesState> {
  GetAiringTodayTVSeries _getAiringTodayTVSeries;
  NowPlayingTVSeriesBloc(this._getAiringTodayTVSeries)
      : super(GetNowPlayingTVSeriesEmpty()) {
    on<OnGetNowPlayingTVSeries>((event, emit) async {
      emit(GetNowPlayingTVSeriesLoading());
      final result = await _getAiringTodayTVSeries.execute();

      result.fold(
        (failure) {
          emit(GetNowPlayingTVSeriesError(failure.message));
        },
        (data) {
          emit(GetNowPlayingTVSeriesHasData(data));
        },
      );
    });
  }
}
