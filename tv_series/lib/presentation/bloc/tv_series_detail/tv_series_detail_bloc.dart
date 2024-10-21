import 'package:bloc/bloc.dart';
import 'package:core/domain/entities/tv_series/tv_series_detail.dart';
import 'package:core/domain/usecases/tv_series/get_tv_series_detail.dart';
import 'package:equatable/equatable.dart';

part 'tv_series_detail_event.dart';
part 'tv_series_detail_state.dart';

class TVSeriesDetailBloc
    extends Bloc<TvSeriesDetailEvent, TVSeriesDetailState> {
  final GetTVSeriesDetail _getTVSeriesDetail;
  TVSeriesDetailBloc(this._getTVSeriesDetail) : super(TVSeriesDetailEmpty()) {
    on<OnGetTVSeriesDetail>((event, emit) async {
      emit(TVSeriesDetailLoading());
      final result = await _getTVSeriesDetail.execute(event.id);
      result.fold(
        (error) {
          emit(TVSeriesDetailError(error.message));
        },
        (data) {
          emit(TVSeriesDetailHasData(data));
        },
      );
    });
  }
}
