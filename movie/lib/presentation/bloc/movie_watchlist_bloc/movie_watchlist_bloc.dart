import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:core/common/watch_category_enum.dart';
import 'package:core/domain/entities/movie/movie_detail.dart';
import 'package:core/domain/usecases/watchlist/get_watchlist_status.dart';
import 'package:core/domain/usecases/watchlist/remove_watchlist.dart';
import 'package:core/domain/usecases/watchlist/save_watchlist_movie.dart';
import 'package:equatable/equatable.dart';

part 'movie_watchlist_event.dart';
part 'movie_watchlist_state.dart';

class MovieWatchlistBloc
    extends Bloc<MovieWatchlistEvent, MovieWatchlistState> {
  final GetWatchListStatus _getWatchListStatus;
  final SaveWatchlistMovie _saveWatchlistMovie;
  final RemoveWatchlist _removeWatchlist;
  MovieWatchlistBloc(
      this._getWatchListStatus, this._saveWatchlistMovie, this._removeWatchlist)
      : super(MovieWatchlistInitial()) {
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
    final result = await _saveWatchlistMovie.execute(event.movie);

    result.fold((failure) {
      emit(SaveWatchlistError(failure.message));
    }, (successMessage) {
      emit(SaveWatchlistSuccess(successMessage));
      add(OnGetWatchlistStatus(event.movie.id, WatchCategory.movie));
    });
  }

  FutureOr<void> _removeWatchlistAct(
      OnRemoveWatchlist event, Emitter emit) async {
    final result = await _removeWatchlist.execute(event.id, event.category);
    result.fold((failure) {
      emit(RemoveWatchlistError(failure.message));
    }, (successMessage) {
      emit(RemoveWatchlistSuccess(successMessage));
      add(OnGetWatchlistStatus(event.id, WatchCategory.movie));
    });
  }
}
