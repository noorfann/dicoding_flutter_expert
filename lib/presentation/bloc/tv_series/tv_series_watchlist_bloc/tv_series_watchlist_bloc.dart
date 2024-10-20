import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:ditonton/common/watch_category_enum.dart';
import 'package:ditonton/domain/entities/tv_series/tv_series_detail.dart';
import 'package:ditonton/domain/usecases/watchlist/get_watchlist_status.dart';
import 'package:ditonton/domain/usecases/watchlist/remove_watchlist.dart';
import 'package:ditonton/domain/usecases/watchlist/save_watchlist_tv_series.dart';
import 'package:equatable/equatable.dart';

part 'tv_series_watchlist_event.dart';
part 'tv_series_watchlist_state.dart';

class TvSeriesWatchlistBloc extends Bloc<TvWatchlistEvent, TvWatchlistState> {
  final GetWatchListStatus _getWatchListStatus;
  final SaveWatchlistTvSeries _saveWatchlistTVSeries;
  final RemoveWatchlist _removeWatchlist;
  TvSeriesWatchlistBloc(this._getWatchListStatus, this._saveWatchlistTVSeries,
      this._removeWatchlist)
      : super(TvWatchlistInitial()) {
    on<OnGetWatchlistStatus>(_getWatchlistStatusAct);

    on<OnSaveWatchlist>(_saveWatchlistAct);

    on<OnRemoveWatchlist>(_removeWatchlistAct);
  }

  FutureOr<void> _getWatchlistStatusAct(
      OnGetWatchlistStatus event, Emitter emit) async {
    emit(WatchlistStatusLoading());
    final result = await _getWatchListStatus.execute(event.id, event.category);
    emit(WatchlistStatusLoaded(result));
  }

  FutureOr<void> _saveWatchlistAct(OnSaveWatchlist event, Emitter emit) async {
    emit(SaveWatchlistLoading());
    final result = await _saveWatchlistTVSeries.execute(event.tvSeriesDetail);

    result.fold((failure) {
      emit(SaveWatchlistError(failure.message));
    }, (successMessage) {
      emit(SaveWatchlistSuccess(successMessage));
      add(OnGetWatchlistStatus(
          event.tvSeriesDetail.id, WatchCategory.tvSeries));
    });
  }

  FutureOr<void> _removeWatchlistAct(
      OnRemoveWatchlist event, Emitter emit) async {
    final result = await _removeWatchlist.execute(event.id, event.category);
    result.fold((failure) {
      emit(SaveWatchlistError(failure.message));
    }, (successMessage) {
      emit(SaveWatchlistSuccess(successMessage));
      add(OnGetWatchlistStatus(event.id, WatchCategory.tvSeries));
    });
  }
}
